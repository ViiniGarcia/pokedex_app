import 'package:flutter/material.dart';
import 'package:pokedex_app/classes/pokemon_type.dart';

import '../Api/api_pokedex.dart';
import '../classes/type_damage.dart';
import '../widgets/list_types_image.dart';

class TypeView extends StatefulWidget {
  const TypeView({super.key, required this.type});

  final PokemonType type;

  @override
  State<TypeView> createState() => _TypeViewState();
}

class _TypeViewState extends State<TypeView> {
  late PokemonType type;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiPokedex().getType(widget.type.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          type = widget.type;
          type = snapshot.data!;
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: _information(type),
              ),
            ),
          );
        } else {
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

_information(PokemonType type) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: Image.network(
          fit: BoxFit.fitHeight,
          errorBuilder: (context, error, stackTrace) =>
              const Text('Imagem indísponivel'),
          'https://raw.githubusercontent.com/ViiniGarcia/PokedexSprites/main/Sprites/Types/type=${type.name}.png',
          filterQuality: FilterQuality.high,
        ),
      ),
      Text(
        type.name,
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
      Card(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 20, 20),
          child: Column(
            children: [
              const ListTile(
                title: Text(
                  "Weakness",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _damageList('2x', 2, type.doubleDamageFrom!),
              _damageList('½', 0.5, type.halfDamageFrom!),
              _damageList('0', 0, type.halfDamageFrom!),
              const ListTile(
                title: Text(
                  "Resistence",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _damageList('2x', 2, type.doubleDamageTo!),
              _damageList('½', 0.5, type.halfDamageTo!),
              _damageList('0', 0, type.halfDamageTo!),
            ],
          ),
        ),
      ),
    ],
  );
}

_damageList(
  String textDamage,
  double damage,
  List<TypeDamage> listDamage,
) {
  return Visibility(
    visible:
        listDamage.where((type) => type.damage == damage).toList().isNotEmpty,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Text(textDamage),
          SizedBox(
            height: 30,
            child: ListTypesImage(
                isDamage: true,
                listDamage:
                    listDamage.where((type) => type.damage == damage).toList()),
          ),
        ],
      ),
    ),
  );
}
