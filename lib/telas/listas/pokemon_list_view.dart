import 'package:flutter/material.dart';
import 'package:pokedex_app/Widgets/card_pokemon.dart';
import 'package:pokedex_app/api/api_pokedex.dart';
import 'package:pokedex_app/classes/pokemon.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  List<Pokemon> listPokemons = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiPokedex().getAllPokemon(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          listPokemons = snapshot.data!;
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1,
                    ),
                    itemCount: listPokemons.length,
                    itemBuilder: (context, index) {
                      return CardPokemon(pokemon: listPokemons[index],);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
