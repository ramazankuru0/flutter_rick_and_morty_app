// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/product/enums/size_ratio.dart';

import 'package:rick_and_morty/product/model/character.dart';
import 'package:rick_and_morty/product/widget/padding.dart';

@RoutePage()
final class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key, required this.character});
  final Character? character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const ProjectPadding.symmetricHorizontal(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  character?.image ?? '',
                  height: MediaQuery.of(context).size.height * SizeRatio.xlargeRatio.value,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * SizeRatio.xsmallRatio.value),
              Text(
                character?.name ?? '',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (character?.status ?? '').contains('Alive')
                            ? Colors.green
                            : (character?.status ?? '').contains('Dead')
                                ? Colors.red
                                : Colors.grey),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * SizeRatio.xxsmallRatio.value),
                  CustomText(title: '${character?.status ?? ''} - ${character?.species ?? ''}'),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * SizeRatio.xsmallRatio.value),
              CustomText(title: 'Gender : ${character?.gender ?? ''}'),
              CustomText(title: 'Origin : ${character?.origin?.name ?? ''}'),
              CustomText(title: 'Location : ${character?.location?.name ?? ''}')
            ],
          ),
        ),
      ),
    );
  }
}

final class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
