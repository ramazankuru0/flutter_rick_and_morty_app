import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/product/model/character.dart';

import '../enums/service_path.dart';
import '../model/location.dart';

abstract class ILocationService {
  ILocationService(this.dio);
  final Dio dio;
  Future<List<Location>?> getLocation(int page);
  Future<List<Character>?> getLocationCharacter(List<String> urls);
}

final class LocationService extends ILocationService {
  LocationService(super.dio);

  @override
  Future<List<Location>?> getLocation(int page) async {
    try {
      final response = await dio.get('${ServicePath.location.value}$page');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map) {
          final res = jsonBody['results'] as List;
          return res.map((e) => Location.fromJson(e)).toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<List<Character>?> getLocationCharacter(List<String> urls) async {
    List<Character> characters = [];
    try {
      for (String url in urls) {
        final response = await dio.get(url);
        if (response.statusCode == HttpStatus.ok) {
          final jsonBody = response.data;
          if (jsonBody is Map<String, dynamic>) {
            characters.add(Character.fromJson(jsonBody));
          }
        } else {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
    return characters;
  }
}
