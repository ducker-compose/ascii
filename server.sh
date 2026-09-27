#!/bin/sh

read -r METHOD URL PROTO

URL=$(printf '%s' "$URL" | tr -d '\r\n')
URL="${URL%%\?*}"

while IFS= read -r LINE; do
    LINE=$(printf '%s' "$LINE" | tr -d '\r')
    [ -z "$LINE" ] && break
done

case "$URL" in
    *..*)
        printf 'HTTP/1.1 400 Bad Request\r\nConnection: close\r\n\r\n400 Bad Request'
        exit 0
        ;;
esac

if [ "$URL" = "/" ] || [ -z "$URL" ]; then
    URL="/index.html"
fi

FILE="/var/www/ascii.ftp.sh$URL"

if [ -f "$FILE" ]; then
    case "$FILE" in
        *.html) MIME="text/html; charset=us-ascii" ;;
        *.gif)  MIME="image/gif" ;;
        *.png)  MIME="image/png" ;;
        *.txt)  MIME="text/plain; charset=us-ascii" ;;
        *)      MIME="application/octet-stream" ;;
    esac
    SIZE=$(wc -c < "$FILE")
    printf 'HTTP/1.1 200 OK\r\nContent-Type: %s\r\nContent-Length: %s\r\nConnection: close\r\n\r\n' "$MIME" "$SIZE"
    cat "$FILE"
else
    printf 'HTTP/1.1 404 Not Found\r\nConnection: close\r\n\r\n404 Not Found'
fi