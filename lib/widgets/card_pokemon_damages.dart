import 'package:flutter/material.dart';
import 'package:pokedex_app/classes/type_damage.dart';
import 'package:pokedex_app/widgets/list_types_image.dart';

class CardPokemonDamages extends StatelessWidget {
  const CardPokemonDamages(
      {super.key, required this.listDamageFrom, required this.listDamageTo});

  final List<TypeDamage> listDamageFrom;
  final List<TypeDamage> listDamageTo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 20, 20),
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'Weakness',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _damageList('4x', 4, listDamageFrom),
            _damageList('2x', 2, listDamageFrom),
            const ListTile(
              title: Text(
                'Resistence',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _damageList('½', 0.5, listDamageFrom),
            _damageList('¼', 0.25, listDamageFrom),
          ],
        ),
      ),
    );
  }
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
