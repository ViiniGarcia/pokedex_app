import 'package:flutter/material.dart';
import 'package:pokedex_app/api/api_pokedex.dart';

import '../classes/pokemon.dart';

class PokemonView extends StatefulWidget {
  PokemonView({super.key, required this.pokemon});

  Pokemon pokemon;

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiPokedex().getPokemon(widget.pokemon.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          widget.pokemon = snapshot.data!;
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
              //TODO corrigir trecho visão de pokemon bugada
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black12,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Text(
                          '#${widget.pokemon.id.toString()}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.pokemon.name,
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.network(
                            fit: BoxFit.fitHeight,
                            scale: 1,
                            errorBuilder: (context, error, stackTrace) =>
                            const Text('Imagem indísponivel'),
                            'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${widget.pokemon.id.toString().padLeft(3,'0')}.png',
                            height: 300,
                          ),
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.pokemon.types?.length,
                              itemBuilder: (BuildContext context, int index){
                                return Image.network(
                                  fit: BoxFit.fitWidth,
                                  errorBuilder: (context, error, stackTrace) =>
                                  const Text('Imagem indísponivel'),
                                  'https://raw.githubusercontent.com/ViiniGarcia/PokedexSprites/main/Sprites/Types/type=${widget.pokemon.types?[index].id}.png',
                                );
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
