import 'dart:convert';

import 'package:shelf/shelf.dart';

Future<Response> loginHandler(Request request) async {
  final body = json.decode(await request.readAsString());

  if (body['login'] == 'foo' && body['pwd'] == 'bar') {
    return Response.ok('{"success": true}',
        headers: {'set-cookie': 'foo=bar; Path=/; HttpOnly'});
  }

  return Response(401);
}
