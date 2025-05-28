import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../core/routing/app_router.dart';
import 'package:dio/dio.dart';

final GetIt locator = GetIt.instance
  ..registerLazySingleton(() => AppRouter())
  ..registerLazySingleton(() => Dio())
  ..registerLazySingleton(() => const FlutterSecureStorage())
;