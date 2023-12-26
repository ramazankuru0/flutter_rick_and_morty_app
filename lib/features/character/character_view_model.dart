import 'package:flutter/material.dart';
import 'package:rick_and_morty/product/service/project_dio_mixin.dart';

import '../../product/model/character.dart';
import '../../product/service/character_service.dart';

final class CharacterViewModel extends ChangeNotifier with ProjectDioMixin {
  late final CharacterService service;
  bool isLoading = false;
  bool isLoadingBody = false;
  bool hasMore = true;
  int currentPage = 1;
  List<Character>? characters;

  CharacterViewModel() {
    service = CharacterService(dioService);
  }

  Future<void> fetchCharacter() async {
    currentPage = 1;
    hasMore = true;
    changeLoading();
    characters = await service.getCharacter(currentPage);
    changeLoading();
  }

  Future<void> loadMoreCharacter() async {
    if (isLoading) return;
    currentPage++;
    if (currentPage < 43) {
      var newData = await service.getCharacter(currentPage);
      characters!.addAll(newData as List<Character>);
    } else {
      hasMore = false;
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    isLoading = false;
    hasMore = true;
    currentPage = 1;
    characters?.clear();
    fetchCharacter();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeLoadingBody() {
    isLoadingBody = !isLoadingBody;
    notifyListeners();
  }
}
