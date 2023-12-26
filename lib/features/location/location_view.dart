import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/routes/app_router.gr.dart';
import 'package:rick_and_morty/core/widget/loader_widget.dart';
import 'package:rick_and_morty/features/location/location_view_model.dart';

@RoutePage()
final class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

final class _LocationViewState extends State<LocationView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LocationViewModel>().fetchLocation();
    });
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        context.read<LocationViewModel>().loadMoreEpisode();
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
    return Consumer<LocationViewModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: value.isLoading
              ? const Center(child: LoaderWidget())
              : RefreshIndicator(
                  onRefresh: value.refresh,
                  child: ListView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.locations?.length == null ? 0 : value.locations!.length + 1,
                    itemBuilder: (context, index) {
                      if (index < value.locations!.length) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              context.router.push(LocationDetailRoute(location: value.locations?[index]));
                            },
                            title: Text(value.locations?[index].name ?? ''),
                            subtitle: Text(value.locations?[index].type ?? ''),
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
