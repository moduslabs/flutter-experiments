# Flutter Client for the Provider Experiment

The client-side of the Flutter experiment demonstrating the usage of the [provider](https://pub.dev/packages/provider) and [dio](https://pub.dev/packages/dio) packages
as well as dealing with CORS requests, route guards and state management.

# Running the app

## Local dev web server

If you have [Flutter](https://docs.flutter.dev/get-started/install) installed locally you can run the app on a local dev web server:

```
$ flutter run -d web-server --web-port=8081 --web-hostname=0.0.0.0
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```
