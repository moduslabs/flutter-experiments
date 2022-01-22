import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'auth.dart';
import '../injector.dart';

class PingModel extends ChangeNotifier {
  AuthModel? _auth;
  List? _items;
  int count = 0;

  update(AuthModel auth) {
    _auth = auth;

    if (auth.isAuthenticated == false) {
      reset(false);
    }
  }

  reset([bool notify = true]) {
    _items = null;
    count = 0;
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
        count++;
        notifyListeners();
      }
    } catch (e) {
      _auth?.logout();
      return;
    }
  }
}
