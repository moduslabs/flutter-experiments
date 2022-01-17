import 'package:get_it/get_it.dart';
import "package:dio/dio.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'client.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerFactoryParam<Dio, BaseOptions?, void>(
      (s, _) => newDio(options: s, useCsrfInterceptor: true));
}
