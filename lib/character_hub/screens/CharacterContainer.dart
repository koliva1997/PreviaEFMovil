import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/Character.dart';
import 'CharacterCard.dart';

class CharacterContainer extends StatefulWidget {
  final List<Character>? characters;
  const CharacterContainer({super.key, required this.characters});

  @override
  State<CharacterContainer> createState() => _CharacterContainerState();
}

class _CharacterContainerState extends State<CharacterContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        key: UniqueKey(),
        children: [
          Text(
            "Search results (${widget.characters?.length ?? 0}):",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          if (widget.characters != null)
            ...widget.characters!.map(
              (character) => CharacterCard(character: character)
            ).toList(),
        ],
      )
    );
  }
}