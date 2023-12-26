// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/widget/loader_widget.dart';
import 'package:rick_and_morty/features/episode/episode_view_model.dart';

import 'package:rick_and_morty/product/model/episode.dart';
import 'package:rick_and_morty/product/widget/character_card.dart';
import 'package:rick_and_morty/product/widget/padding.dart';

@RoutePage()
final class EpisodeDetailView extends StatefulWidget {
  const EpisodeDetailView({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Episode? episode;

  @override
  State<EpisodeDetailView> createState() => _EpisodeDetailViewState();
}

final class _EpisodeDetailViewState extends State<EpisodeDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<EpisodeViewModel>().fetchEpisodeCharacter(widget.episode?.characters ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.episode?.name ?? ''),
        actions: [Text('Date: ${widget.episode?.airDate ?? ''}')],
      ),
      body: context.watch<EpisodeViewModel>().isLoadingDetail
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
                    itemCount: context.watch<EpisodeViewModel>().episodeCharacter?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CharacterCard(characters: context.watch<EpisodeViewModel>().episodeCharacter?[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
