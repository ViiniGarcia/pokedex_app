import 'package:flutter/material.dart';
import 'package:pokedex_app/api/api_pokedex.dart';
import 'package:pokedex_app/widgets/card_pokemon_details.dart';
import 'package:pokedex_app/widgets/list_types_image.dart';

import '../classes/pokemon.dart';
import '../widgets/card_damages_pokemon.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {

  late Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiPokedex().getPokemon(widget.pokemon.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          pokemon = widget.pokemon;
          pokemon = snapshot.data!;
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _informationColumn(pokemon),
                      _imagePokemon(pokemon),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

_informationColumn(Pokemon pokemon){
  return Expanded(
    child: Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black12,
            ),
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Text(
              '#${pokemon.id.toString()}',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            pokemon.name,
            style: const TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 30,
              child: ListTypesImage(isDamage: false, listType: pokemon.types!,),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CardPokemonDetails(pokemon: pokemon),
      ],
    ),
  );
}

_imagePokemon(Pokemon pokemon){
  return Expanded(
    child: Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Stack(
            children:[
              Image.network(
                fit: BoxFit.fitHeight,
                scale: 1,
                errorBuilder: (context, error, stackTrace) =>
                const Text('Imagem indísponivel'),
                'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${pokemon.id.toString().padLeft(3,'0')}.png',
                height: 300,
              ),
            ]
          ),
        ),
        CardDamagesPokemon(listDamageFrom: pokemon.damageFrom!, listDamageTo: pokemon.damageTo!),
      ],
    ),
  );
}