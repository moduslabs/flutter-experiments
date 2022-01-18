import 'package:shelf/shelf.dart';

Response pingHandler(Request request) {
  if (_isAuthenticated(request.headers['cookie'])) {
    return Response.ok('["foo", "bar"]');
  }

  return Response.forbidden('{"error": "not authenticated"}');
}

bool _isAuthenticated(String? cookies) {
  if (cookies == null) {
    return false;
  }

  return cookies.split('; ').any((cookie) {
    if (cookie.isEmpty) {
      return false;
    }
    final parsed = cookie.split('=');
    return parsed[0] == 'foo' && parsed[1] == 'bar';
  });
}
