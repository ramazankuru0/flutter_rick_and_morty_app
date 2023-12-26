import 'package:flutter/material.dart';
import 'package:rick_and_morty/product/model/character.dart';
import 'package:rick_and_morty/product/service/character_service.dart';
import 'package:rick_and_morty/product/service/project_dio_mixin.dart';

final class SearchViewModel extends ChangeNotifier with ProjectDioMixin {
  bool isLoading = false;
  late final CharacterService service;
  List<Character>? characters;

  SearchViewModel() {
    service = CharacterService(dioService);
  }

  Future<void> fetchSearchCharacter(String name) async {
    changeLoading();
    characters = await service.getSearchCharacter(name);
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
