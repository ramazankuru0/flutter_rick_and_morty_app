import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final dioService = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));
}
