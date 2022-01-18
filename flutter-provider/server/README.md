# Dart server for the Flutter Provider Experiment

A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

This server handles requests to:
- GET `/csrf` - Returns a pseudo CSRF token
- POST `/login` - Pseudo authentication and session creation (requires a CSRF token)
- GET `/ping` - Returns an array of strings (requires a pseudo session cookie)

# Implementation

The server implements pseudo CSRF protection and Session management enough to support the client-side experiment.
Mainly to demonstrate a bare-bones example of CORS requests in [Flutter](https://flutter.dev/).

# Running the server

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 8080
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```
