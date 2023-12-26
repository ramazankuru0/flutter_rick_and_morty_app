import 'package:flutter/material.dart';
import 'package:rick_and_morty/product/widget/padding.dart';

import '../enums/size_ratio.dart';
import '../model/character.dart';

final class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.characters,
  });

  final Character? characters;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const ProjectPadding.symmetric(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              characters?.image ?? '',
              height: MediaQuery.of(context).size.height * SizeRatio.largeRatio.value,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * SizeRatio.smallRatio.value),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  characters?.name ?? '',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (characters?.status ?? '').contains('Alive')
                              ? Colors.green
                              : (characters?.status ?? '').contains('Dead')
                                  ? Colors.red
                                  : Colors.grey),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * SizeRatio.xxsmallRatio.value),
                    Expanded(
                      child: Text(
                        '${characters?.status ?? ''} - ${characters?.species ?? ''}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
