import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/product/model/character.dart';

import '../enums/service_path.dart';

abstract class ICharacterService {
  ICharacterService(this.dio);
  final Dio dio;
  Future<List<Character>?> getCharacter(int page);
  Future<List<Character>?> getSearchCharacter(String name);
}

final class CharacterService extends ICharacterService {
  CharacterService(super.dio);

  @override
  Future<List<Character>?> getCharacter(int page) async {
    try {
      final response = await dio.get('${ServicePath.characterPage.value}$page');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map) {
          final res = jsonBody['results'] as List;
          return res.map((e) => Character.fromJson(e)).toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<List<Character>?> getSearchCharacter(String name) async {
    try {
      final response = await dio.get('${ServicePath.characterName.value}$name');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map) {
          final res = jsonBody['results'] as List;

          return res.map((e) => Character.fromJson(e)).toList();
        }
      } else if (response.statusCode == 404) {
        return <Character>[];
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
