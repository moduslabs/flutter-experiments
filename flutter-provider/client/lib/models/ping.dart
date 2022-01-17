import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'auth.dart';
import '../injector.dart';

class PingModel extends ChangeNotifier {
  AuthModel? _auth;
  List? _items;

  update(AuthModel auth) {
    _auth = auth;

    if (auth.isAuthenticated == false) {
      reset(false);
    }
  }

  reset([bool notify = true]) {
    _items = null;
    if (notify) {
      notifyListeners();
    }
  }

  List get items {
    if (_items == null) {
      ping();
      return _items = [];
    }
    return _items!;
  }

  Future<void> ping() async {
    try {
      final res = await getIt<Dio>().get<List>("/ping");
      if (res.data != null) {
        _items?.addAll(res.data!);
        notifyListeners();
      }
    } on DioError catch (e) {
      if ([401, 403].contains(e.response?.statusCode)) {
        _auth?.logout();
        return;
      }

      rethrow;
    }
  }
}
