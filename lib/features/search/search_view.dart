// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:async/async.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty/core/routes/app_router.gr.dart';
import 'package:rick_and_morty/core/widget/loader_widget.dart';
import 'package:rick_and_morty/features/search/search_view_model.dart';
import 'package:rick_and_morty/product/constants/string_constants.dart';
import 'package:rick_and_morty/product/widget/character_card.dart';

import '../../product/enums/size_ratio.dart';

@RoutePage()
final class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

final class _SearchViewState extends State<SearchView> with CancelOperation {
  @override
  Widget build(BuildContext context) {
    final characterList = context.watch<SearchViewModel>().characters;
    return Scaffold(
      body: Column(
        children: [
          SearchBarWidget(onChanged: search),
          SizedBox(height: MediaQuery.of(context).size.height * SizeRatio.xsmallRatio.value),
          context.watch<SearchViewModel>().isLoading
              ? const Center(child: LoaderWidget())
              : Expanded(
                  child: ListView.builder(
                    itemCount: characterList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            context.router.push(CharacterDetailRoute(character: characterList?[index]));
                          },
                          child: CharacterCard(characters: characterList?[index]));
                    },
                  ),
                )
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(Icons.search_outlined),
      hintText: StringConstants.searchCharacter,
      onChanged: onChanged,
    );
  }
}

mixin CancelOperation on State<SearchView> {
  CancelableOperation<void>? _cancelableOperation;
  Future<void> search(String name) async {
    _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(Durations.long2),
      onCancel: () => debugPrint('cancelled'),
    );
    _cancelableOperation?.value.then((value) {
      context.read<SearchViewModel>().fetchSearchCharacter(name);
    });
  }
}
