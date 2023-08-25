import 'package:pokedex_app/Api/api_pokedex.dart';
import 'package:pokedex_app/classes/type_damage.dart';

import '../utils/damage_relations.dart';

class PokemonType{
  int id;
  String name;
  List<TypeDamage>? doubleDamageFrom;
  List<TypeDamage>? halfDamageFrom;
  List<TypeDamage>? noDamageFrom;
  List<TypeDamage>? doubleDamageTo;
  List<TypeDamage>? halfDamageTo;
  List<TypeDamage>? noDamageTo;


  PokemonType(
      this.id,
      this.name,
      [this.doubleDamageFrom,
      this.halfDamageFrom,
      this.noDamageFrom,
      this.doubleDamageTo,
      this.halfDamageTo,
      this.noDamageTo]
  );

  factory PokemonType.fromBasicJson(Map<String, dynamic> data){
    return PokemonType(
      int.parse(data['url'].toString().replaceAll(RegExp(r'[^0-9]'), '').substring(1)),
      data['name'],
    );
  }

  factory PokemonType.fromCompleteJson(Map<String, dynamic> data){
    return PokemonType(
        data['id'],
        data['name'],
        listDamage(data['damage_relations']['double_damage_from'], 2),
        listDamage(data['damage_relations']['half_damage_from'], 0.5),
        listDamage(data['damage_relations']['no_damage_from'], 0),
        listDamage(data['damage_relations']['double_damage_to'], 2),
        listDamage(data['damage_relations']['half_damage_to'], 0.5),
        listDamage(data['damage_relations']['no_damage_to'], 0)
    );
  }
}

Future<List<PokemonType>> listCompletePokemonType(List<PokemonType> listTypes) async {
  List<PokemonType> listCompleteTypes = [];
  for(PokemonType type in listTypes){
    type = await ApiPokedex().getType(type.id);
    listCompleteTypes.add(type);
  }
  return listCompleteTypes;
}