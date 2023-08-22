import 'package:flutter/material.dart';
import 'package:pokedex_app/classes/pokemon.dart';

class ListTypesImage extends StatelessWidget {
  const ListTypesImage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: pokemon.types?.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(2),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) =>
              const Text('Imagem indísponivel'),
              'https://raw.githubusercontent.com/ViiniGarcia/PokedexSprites/main/Sprites/Types/type=${pokemon.types?[index].name}.png',
            ),
          );
        }
    );
  }
}
