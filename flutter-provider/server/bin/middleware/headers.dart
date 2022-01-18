import 'dart:async';

import 'package:shelf/shelf.dart';

const _headers = {
  'content-type': 'application/json',
  'X-CSRF-TOKEN': 'TOKEN',
  'access-control-allow-origin': 'http://localhost:8081',
  'access-control-allow-credentials': 'true',
  'access-control-allow-headers':
      'Origin, Content-Type, Accept, Authorization, Cookie, Set-Cookie, X-CSRF-TOKEN',
};

Middleware addHeaders() {
  return createMiddleware(
      responseHandler: _addHeaders, requestHandler: _handleOptionsReq);
}

FutureOr<Response?> _handleOptionsReq(Request request) {
  if (request.method == 'OPTIONS') {
    return Response.ok(null, headers: _headers);
  }

  if (request.requestedUri.path != "/csrf" &&
      request.headers['x-csrf-token'] != 'TOKEN') {
    return Response.forbidden(null, headers: _headers);
  }

  return null;
}

FutureOr<Response> _addHeaders(Response response) {
  return response.change(headers: _headers);
}
