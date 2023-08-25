import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/bar_chart_stats.dart';

import '../classes/pokemon.dart';

class CardPokemonDetails extends StatelessWidget {
  const CardPokemonDetails({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("Height"),
                  subtitle: Text("${pokemon.height}m"),
                  leading: const Icon(Icons.height),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Weight"),
                  subtitle: Text("${pokemon.weight}kg"),
                  leading: const Icon(Icons.line_weight),
                ),
              ),
            ],
          ),
          StatsChart(pokemon: pokemon,),
        ],
      ),
    );
  }
}