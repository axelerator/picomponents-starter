# Picomponents starter template

This is a [Elm](https://guide.elm-lang.org) example app using the 
[picomponents](https://package.elm-lang.org/packages/axelerator/picomponents/latest/) package.

[Live Demo](https://blog.axelerator.de/picomponents-starter)

Every time I start a new project I nearly always want to start with the following things:

- A user login
- A way to navigate between pages
- A _"nice"_ looking UI
- An easy way to collect data from the user

This provides a good starting point for all of these things. It's **not** a good starting point
if you've never worked with [Elm](https://guide.elm-lang.org) before since it borrows some
involved patterns from the [Elm SPA example](https://github.com/rtfeldman/elm-spa-example).

## Getting started

Clone and compile the project:

```
elm make $dir/src/Main.elm --output=$dir/main.js
```

or run `./bin/build.sh` (only tested on MacOS)

Since we're using [Browser.application](https://package.elm-lang.org/packages/elm/browser/latest/Browser#application) the
app must actually be served by a web server.

The project contains a [Caddyfile](https://caddyserver.com/docs/caddyfile-tutorial) that you can use to serve the
app with `caddy run`.

Alternatively you can use Python's `python3 -m http.server` if that's your thing (reloading on any other URL than `/` won't work
then though because the other routes don't correspond with actual files).
