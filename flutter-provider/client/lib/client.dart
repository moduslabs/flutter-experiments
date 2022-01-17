import "package:dio/dio.dart";

String? _csrf;

Dio _newDio() {
  Dio dio = Dio();
  dio.options.baseUrl = "http://localhost:8080";
  dio.options.extra['withCredentials'] = true;
  return dio;
}

class Client {
  Dio init() {
    Dio _dio = _newDio();
    _dio.interceptors.add(CsrfInterceptor());
    return _dio;
  }
}

class CsrfInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(options, handler) {
    if (_csrf != null) {
      options.headers['X-CSRF-TOKEN'] = _csrf;
      return handler.next(options);
    }

    _newDio().get('/csrf').then((data) {
      options.headers['X-CSRF-TOKEN'] = _csrf = data.data['token'];
      handler.next(options);
    }).catchError((err) {
      handler.reject(err, true);
    });
  }

  @override
  void onError(err, handler) {
    if ([401, 403].contains(err.response?.statusCode)) {
      //
    }
    handler.next(err);
  }

  @override
  void onResponse(response, handler) {
    var newToken = response.headers['X-CSRF-TOKEN'];
    if (newToken != null && newToken.isNotEmpty) {
      _csrf = newToken[0];
    }
    handler.next(response);
  }
}
