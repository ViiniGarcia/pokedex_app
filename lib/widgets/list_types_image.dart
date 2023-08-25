import 'package:flutter/material.dart';
import 'package:pokedex_app/classes/pokemon_type.dart';

import '../classes/type_damage.dart';

class ListTypesImage extends StatelessWidget {
  const ListTypesImage({super.key,required this.isDamage ,this.listType, this.listDamage});

  final bool isDamage;
  final List<PokemonType>? listType;
  final List<TypeDamage>? listDamage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: isDamage ? listDamage!.length : listType!.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(2),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) =>
              const Text('Imagem indísponivel'),
              'https://raw.githubusercontent.com/ViiniGarcia/PokedexSprites/main/Sprites/Types/type=${isDamage ? listDamage![index].name : listType![index].name}.png',
            ),
          );
        }
    );
  }
}
