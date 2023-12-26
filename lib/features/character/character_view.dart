import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/routes/app_router.gr.dart';
import 'package:rick_and_morty/core/widget/loader_widget.dart';
import 'package:rick_and_morty/features/character/character_view_model.dart';

import '../../product/widget/character_card.dart';

@RoutePage()
final class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

final class _CharacterViewState extends State<CharacterView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CharacterViewModel>().fetchCharacter();
    });
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        context.read<CharacterViewModel>().loadMoreCharacter();
      }
    });
    debugPrint('initstate');
  }

  @override
  void dispose() {
    scrollController.dispose();
    debugPrint('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: value.isLoading
              ? const Center(child: LoaderWidget())
              : RefreshIndicator(
                  onRefresh: value.refresh,
                  child: Column(
                    children: [
                      value.isLoadingBody
                          ? const Center(child: LoaderWidget())
                          : Expanded(
                              child: ListView.builder(
                                controller: scrollController,
                                physics: const BouncingScrollPhysics(),
                                itemCount: value.characters?.length == null ? 0 : value.characters!.length + 1,
                                itemBuilder: (context, index) {
                                  if (index < value.characters!.length) {
                                    return GestureDetector(
                                      onTap: () {
                                        context.router.push(CharacterDetailRoute(character: value.characters?[index]));
                                      },
                                      child: CharacterCard(characters: value.characters?[index]),
                                    );
                                  } else {
                                    return Center(
                                      child: value.hasMore ? const LoaderWidget() : const Text('SON'),
                                    );
                                  }
                                },
                              ),
                            ),
                    ],
                  )),
        );
      },
    );
  }
}
