# Provider Experiment

A Flutter experiment demonstrating the usage of the [provider](https://pub.dev/packages/provider) and [dio](https://pub.dev/packages/dio) packages
as well as dealing with CORS requests, route guards and state management.

It is a simple 2 page application (login and home) that requires authentication to view the home page and requires a valid CSRF token to login.

# Running the experiment

The experiment is configured to run the client and server applications like so:

- Client on http://localhost:8081
- Server on http://localhost:8080

## Running locally with Dart and Flutter

If you have [Flutter](https://docs.flutter.dev/get-started/install) installed locally you can run both the client and the server like so:

Start the client:
```
$ flutter run -d web-server --web-port=8081 --web-hostname=0.0.0.0
```

Start the server:

```
$ dart run bin/server.dart
Server listening on port 8080
```

## Running with Docker

If you have [docker-compose](https://docs.docker.com/compose/install/) installed, you
can build and run with the `docker-compose up` command. This will start both the server and client containers for you.
