import 'package:dio/dio.dart';
import '../api_configuration.dart';
import '../locator.dart';

abstract class BaseRepository {
  //final Dio dio = Dio();
  final Dio dio = locator<Dio>();
  final String url = baseUrl;

}