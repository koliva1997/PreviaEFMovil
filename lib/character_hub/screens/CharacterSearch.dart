import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaaaaaa/character_hub/screens/CharacterContainer.dart';
import 'package:gaaaaaa/character_hub/services/CharacterService.dart';

import '../model/Character.dart';

class CharacterSearch extends StatefulWidget {
  const CharacterSearch({super.key});

  @override
  State<CharacterSearch> createState() => _CharacterSearchState();
}

class _CharacterSearchState extends State<CharacterSearch> {
  
  final TextEditingController searchTermController = TextEditingController();
  CharacterService characterService = CharacterService();
  List<Character>? _characters;
  bool isSearching = false;

  void onSearch(String name) async {
    setState((){
      isSearching = true;
    });
    _characters = await characterService.getByName(name);
    setState((){
      _characters = _characters;
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: searchTermController,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search for a character',
            prefixIcon: Icon(Icons.search),  
            ),
            onSubmitted: onSearch,
          ),
        ),
        Expanded(child: CharacterContainer(characters: _characters),
        )
      ],
    );
  }
  @override
  void dispose(){
    searchTermController.dispose();
    super.dispose();
  }
}