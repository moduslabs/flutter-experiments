import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../injector.dart';

class AuthModel extends ChangeNotifier {
  final SharedPreferences _prefs = getIt<SharedPreferences>();

  bool get isAuthenticated {
    return _prefs.getBool('isAuthenticated') ?? false;
  }

  set isAuthenticated(bool val) {
    _prefs.setBool('isAuthenticated', val);
    notifyListeners();
  }

  logout() {
    isAuthenticated = false;
  }

  Future<void> login(String user, String pwd) async {
    final res = await getIt<Dio>().post("/login", data: {
      'login': user,
      'pwd': pwd,
    });

    if (res.statusCode != 200) {
      logout();
    }

    isAuthenticated = true;
  }
}
