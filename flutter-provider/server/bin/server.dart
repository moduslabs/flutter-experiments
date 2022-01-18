import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'handlers/index.dart';
import 'middleware/index.dart';

final _router = Router()
  ..post('/login', loginHandler)
  ..get('/csrf', csrfHandler)
  ..get('/ping', pingHandler);

void main(List<String> args) async {
  final _handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(addHeaders())
      .addHandler(_router);

  final server = await serve(_handler, InternetAddress.anyIPv4, 8080);
  print('Server listening on port ${server.port}');
}
