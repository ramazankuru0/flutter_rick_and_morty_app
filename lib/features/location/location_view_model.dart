import 'package:flutter/material.dart';
import 'package:rick_and_morty/product/service/location_service.dart';
import 'package:rick_and_morty/product/service/project_dio_mixin.dart';

import '../../product/model/character.dart';
import '../../product/model/location.dart';

final class LocationViewModel extends ChangeNotifier with ProjectDioMixin {
  List<Location>? locations;
  bool isLoading = false;
  bool isLoadingDetail = false;
  int currentPage = 1;
  bool hasMore = true;
  List<Character>? locationCharacter;
  late final ILocationService service;

  LocationViewModel() {
    service = LocationService(dioService);
  }

  Future<void> fetchLocation() async {
    currentPage = 1;
    changeLoading();
    locations = await service.getLocation(currentPage);
    changeLoading();
  }

  Future<void> loadMoreEpisode() async {
    if (isLoading) return;
    currentPage++;
    if (currentPage < 8) {
      var newData = await service.getLocation(currentPage);
      locations!.addAll(newData as List<Location>);
    } else {
      hasMore = false;
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    isLoading = false;
    hasMore = true;
    currentPage = 1;
    locations?.clear();
    fetchLocation();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeLoadingDetail() {
    isLoadingDetail = !isLoadingDetail;
    notifyListeners();
  }

  Future<void> fetchLocationCharacter(List<String> urls) async {
    changeLoadingDetail();
    locationCharacter = await service.getLocationCharacter(urls);
    changeLoadingDetail();
  }
}
