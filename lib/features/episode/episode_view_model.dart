import 'package:flutter/material.dart';
import 'package:rick_and_morty/product/model/character.dart';
import 'package:rick_and_morty/product/service/episode_service.dart';
import 'package:rick_and_morty/product/service/project_dio_mixin.dart';

import '../../product/model/episode.dart';

class EpisodeViewModel extends ChangeNotifier with ProjectDioMixin {
  late final EpisodeService service;
  List<Episode>? episodes;
  int currentPage = 1;
  bool isLoading = false;
  bool isLoadingDetail = false;
  bool hasMore = true;
  List<Character>? episodeCharacter;

  EpisodeViewModel() {
    service = EpisodeService(dioService);
  }

  Future<void> fetchEpisode() async {
    currentPage = 1;
    hasMore = true;
    changeLoading();
    episodes = await service.getEpisode(currentPage);
    changeLoading();
  }

  Future<void> loadMoreEpisode() async {
    if (isLoading) return;
    currentPage++;
    if (currentPage < 4) {
      var newData = await service.getEpisode(currentPage);
      episodes!.addAll(newData as List<Episode>);
    } else {
      hasMore = false;
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    isLoading = false;
    hasMore = true;
    currentPage = 1;
    episodes?.clear();
    fetchEpisode();
  }

  void changeCurrentPage() {
    currentPage = 0;
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeLoadingDetail() {
    isLoadingDetail = !isLoadingDetail;
    notifyListeners();
  }

  Future<void> fetchEpisodeCharacter(List<String> character) async {
    changeLoadingDetail();
    episodeCharacter = await service.getEpisodeCharacter(character);
    changeLoadingDetail();
  }
}
