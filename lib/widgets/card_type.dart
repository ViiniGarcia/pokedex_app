import 'package:flutter/material.dart';
import 'package:pokedex_app/classes/pokemon_type.dart';
import 'package:pokedex_app/telas/type_view.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TypeView(type: widget.type,)),
          );
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
                    leading: const Icon(Icons.layers,size: 20),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: Image.network(
                      //fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) =>
                      const Text('Imagem indísponivel'),
                      'https://raw.githubusercontent.com/ViiniGarcia/PokedexSprites/main/Sprites/Types/type=${widget.type.name}.png',
                      //height: 10,
                      filterQuality: FilterQuality.high,

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
