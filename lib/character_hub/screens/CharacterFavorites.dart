import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaaaaaa/character_hub/persistence/repositories/CharacterRepository.dart';
import 'package:gaaaaaa/character_hub/screens/CharacterCard.dart';

import '../model/Character.dart';

class CharacterFavorites extends StatefulWidget {
  const CharacterFavorites({super.key});

  @override
  State<CharacterFavorites> createState() => _CharacterFavoritesState();
}

class _CharacterFavoritesState extends State<CharacterFavorites> {
  CharacterRepository characterRepository = CharacterRepository();
  List<Character> characters = [];

  @override
  initState(){
    initialize();
    super.initState();
  }

  initialize() async {
    final favoriteCharacters = await characterRepository.getAll() ?? [];
    if (mounted){
      setState(() {
        characters = favoriteCharacters;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        key: UniqueKey(),
        children:[
          Text(
            "Favorite characters (${characters.length}):",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...characters.map(
            (character) => CharacterCard(character: character)
          ).toList()
        ],
      )
    );
  }
}