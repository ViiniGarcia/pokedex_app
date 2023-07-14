import 'package:flutter/material.dart';
import 'package:pokedex_app/classes/pokemon.dart';
import 'package:pokedex_app/telas/pokemon_view.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PokemonView(pokemon: widget.pokemon)),
          );
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:
                    ListTile(
                      title: Text(widget.pokemon.name.toUpperCase()),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.network(
                    fit: BoxFit.fitHeight,
                    scale: 1,
                    errorBuilder: (context, error, stackTrace) =>
                    const Text('Imagem indísponivel'),
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.pokemon.id}.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
