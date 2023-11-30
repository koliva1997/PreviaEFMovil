import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaaaaaa/character_hub/model/Character.dart';
import 'package:gaaaaaa/character_hub/persistence/repositories/CharacterRepository.dart';
import 'package:gaaaaaa/character_hub/screens/CharacterDetail.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  
  CharacterRepository characterRepository = CharacterRepository();
  late Character character;

  bool isFavorite = false;

  @override
  void initState() {
    character = widget.character;
    initialize();
    super.initState();
  }

  void initialize() async {
    isFavorite = await characterRepository.existById(character.id);
    if (mounted){
      setState(
        () {
          isFavorite = isFavorite;
        }
      );
    }
  }

  @override
  Widget build(BuildContext context){
    final characterImage = Image.network(character.image);

    void handleFavorite() async{
      if (isFavorite){
        await characterRepository.delete(character);
      }else{
        await characterRepository.insert(character);
      }
      if(mounted){
        setState(() {
          isFavorite = !isFavorite;
        });
      }
    }
    void HandleTapOnCard(){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => CharacterDetail(character: character)
        )
      );
    }
    return GestureDetector(
      onTap: HandleTapOnCard,
      child: Card(
        child: ListTile(
          leading: characterImage,
          title: Text(character.name),
          subtitle: Text(character.species),
          trailing: IconButton(
            onPressed: handleFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            )
          )
        )
      )
    );
  }
}