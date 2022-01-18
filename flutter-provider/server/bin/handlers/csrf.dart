import 'package:shelf/shelf.dart';

Response csrfHandler(Request request) {
  return Response.ok('{"token": "TOKEN"}');
}
