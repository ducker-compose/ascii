# ascii

Lightweight static webpage dedicated to the ASCII character table. I made it because all the sites at the top of search results are total garbage that steal cookies.

It's simple as a rock: zero dependencies, build steps, or backend.

## Features

- Full 7-bit US-ASCII
- Decimal and hexadecimal values for every character
- Short names for control characters like NUL, LF, CR, and ESC
- Printable character and symbol reference
- Semantic markup and all that
- No frameworks or other junk

## Project structure

- `index.html` – the main page
- `server.sh` – a temporary file server, because I needed to host this page on my machine
- `img/` – 88x31 buttons to make the links look nice

## Run locally

You can view the project's main feature by simply opening `index.html` in your web browser.

If you happen to need a web server:

```bash
python3 -m http.server 8000
```

Then open:

```text
http://localhost:8000/
```

## Notes

Plans for this project include adding support for extensions to the standard and separate pages for each character. I don't yet know in what order. Contributions are welcome, but don't even suggest rewriting it in React.

## License

This project does not have a license yet. If you happen to need one, email me and I'll look into it in my free time.
