import 'package:flutter/material.dart';

import '../classes/pokemon.dart';

class ChainEvolutionPokemon extends StatelessWidget {
  const ChainEvolutionPokemon({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: const Column(
          children: [
            ListTile(
              title: Text(
                'Weakness',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
