import 'package:pokedex_app/Classes/pokemon_type.dart';

class Pokemon{
  int id;
  String name;
  int? baseExp;
  bool? isDefault;
  int? weight;
  int? height;
  List<PokemonType>? types;


  Pokemon(this.id, this.name, [this.baseExp, this.isDefault, this.weight, this.height, this.types]);

  factory Pokemon.fromJson(Map<String, dynamic> data) {
    List<PokemonType> listPokemonTypes = [];
    for(var type in data['types']){
      listPokemonTypes.add(PokemonType.fromJson(type['type']));
    }

    var pokemon = Pokemon(
        data['id'],
        data['name'].toString().replaceAll('-', ' '),
        data['base_experience'],
        data['is_default'],
        data['weight'],
        data['height'],
        listPokemonTypes
    );
    return pokemon;
  }
}