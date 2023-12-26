// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/widget/loader_widget.dart';
import 'package:rick_and_morty/features/location/location_view_model.dart';

import 'package:rick_and_morty/product/model/location.dart';
import 'package:rick_and_morty/product/widget/character_card.dart';
import 'package:rick_and_morty/product/widget/padding.dart';

@RoutePage()
final class LocationDetailView extends StatefulWidget {
  const LocationDetailView({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location? location;

  @override
  State<LocationDetailView> createState() => _LocationDetailViewState();
}

final class _LocationDetailViewState extends State<LocationDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LocationViewModel>().fetchLocationCharacter(widget.location?.residents ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text(widget.location?.dimension ?? '')],
      ),
      body: context.watch<LocationViewModel>().isLoadingDetail
          ? const Center(child: LoaderWidget())
          : Column(
              children: [
                Padding(
                  padding: const ProjectPadding.only(),
                  child: Text(
                    'Characters',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: context.watch<LocationViewModel>().locationCharacter?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CharacterCard(characters: context.watch<LocationViewModel>().locationCharacter?[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
