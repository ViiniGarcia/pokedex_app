import 'package:flutter/material.dart';
import 'package:pokedex_app/classes/pokemon_type.dart';

class CardType extends StatefulWidget {
  const CardType({
    super.key,
    required this.type
  });

  final PokemonType type;

  @override
  State<CardType> createState() => _CardTypeState();
}

class _CardTypeState extends State<CardType> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: (){
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => PokemonView(pokemon: widget.pokemon)),
          // );
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: ListTile(
                    title: Text(
                        widget.type.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: Image.network(
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                      const Text('Imagem indísponivel'),
                      'https://raw.githubusercontent.com/ViiniGarcia/PokedexSprites/main/Sprites/Types/type=${widget.type.name}.png',
                      width: 50,
                    ),
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


//https://raw.githubusercontent.com/ViiniGarcia/PokedexSprites/main/Sprites/Types/type=bug.png
