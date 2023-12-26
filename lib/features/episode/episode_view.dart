import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/routes/app_router.gr.dart';
import 'package:rick_and_morty/core/widget/loader_widget.dart';
import 'package:rick_and_morty/features/episode/episode_view_model.dart';

@RoutePage()
final class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

final class _EpisodeViewState extends State<EpisodeView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<EpisodeViewModel>().fetchEpisode();
    });
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        context.read<EpisodeViewModel>().loadMoreEpisode();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    debugPrint('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EpisodeViewModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: value.isLoading
              ? const Center(child: LoaderWidget())
              : RefreshIndicator(
                  onRefresh: value.refresh,
                  child: ListView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.episodes?.length == null ? 0 : value.episodes!.length + 1,
                    itemBuilder: (context, index) {
                      debugPrint(value.episodes!.length.toString());
                      if (index < value.episodes!.length) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              context.router.push(EpisodeDetailRoute(episode: value.episodes?[index]));
                            },
                            title: Text(value.episodes?[index].episode ?? ''),
                            subtitle: Text(value.episodes?[index].name ?? ''),
                            trailing: const Icon(Icons.chevron_right_outlined),
                          ),
                        );
                      } else {
                        return Center(
                          child: value.hasMore ? const LoaderWidget() : const Text('SON'),
                        );
                      }
                    },
                  ),
                ),
        );
      },
    );
  }
}
