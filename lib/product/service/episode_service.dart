import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/product/model/character.dart';
import 'package:rick_and_morty/product/model/episode.dart';

import '../enums/service_path.dart';

abstract class IEpisodeService {
  IEpisodeService(this.dio);
  final Dio dio;
  Future<List<Episode>?> getEpisode(int page);
  Future<List<Character>?> getEpisodeCharacter(List<String> urls);
}

final class EpisodeService extends IEpisodeService {
  EpisodeService(super.dio);

  @override
  Future<List<Episode>?> getEpisode(int page) async {
    try {
      final response = await dio.get('${ServicePath.episode.value}$page');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map) {
          final res = jsonBody['results'] as List;
          return res.map((e) => Episode.fromJson(e)).toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<List<Character>?> getEpisodeCharacter(List<String> urls) async {
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
