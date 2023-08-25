import 'package:pokedex_app/classes/pokemon_type.dart';
import 'package:pokedex_app/classes/type_damage.dart';

class Pokemon{
  int id;
  String name;
  int? baseExp;
  bool? isDefault;
  double? weight;
  double? height;
  List<PokemonType>? types;
  List<TypeDamage>? damageFrom;
  List<TypeDamage>? damageTo;


  Pokemon(this.id, this.name, [this.baseExp, this.isDefault, this.weight, this.height, this.types, this.damageFrom, this.damageTo]);

  factory Pokemon.fromJson(Map<String, dynamic> dataPokemon) {
    List<PokemonType> listPokemonTypes = [];

    for(var type in dataPokemon['types']){
      listPokemonTypes.add(PokemonType.fromBasicJson(type['type']));
    }

    var pokemon = Pokemon(
        dataPokemon['id'],
        dataPokemon['name'].toString().replaceAll('-', ' '),
        dataPokemon['base_experience'],
        dataPokemon['is_default'],
        dataPokemon['weight']/10.toDouble(),
        dataPokemon['height']/10.toDouble(),
        listPokemonTypes
    );
    return pokemon;
  }
}