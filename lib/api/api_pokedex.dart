import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/classes/pokemon.dart';
import 'package:pokedex_app/classes/pokemon_type.dart';

class ApiPokedex {
  
  String authority = 'pokeapi.co';

  Uri criaUri(String pathParameters, [Map<String, dynamic>? queryParameters]) {
    return Uri.https(authority, pathParameters, queryParameters);
  }

  Future<List<Pokemon>> getAllPokemon() async {
    try {
      var url = criaUri('/api/v2/pokemon/', {'limit': '1010'});
      var response = await http.Client().get(url);
      Map<String, dynamic> responseJson = json.decode(response.body);
      List<Pokemon> listPokemons = [];
      for (var data in responseJson['results']) {
        listPokemons.add(
           Pokemon(
             int.parse(data['url'].toString().replaceAll(RegExp(r'[^0-9]'), '').substring(1)),
             data['name'].toString().replaceAll('-', ' ')
           )
        );
      }
      return listPokemons;
    } finally {
      http.Client().close();
    }
  }

  Future<Pokemon> getPokemon(int idPokemon) async {
    try {
      var url = criaUri('/api/v2/pokemon/$idPokemon/');
      var response = await http.Client().get(url);
      Map<String, dynamic> data = json.decode(response.body);
      Pokemon pokemon = Pokemon.fromJson(data);
      List<PokemonType> listTypes = [];
      for(PokemonType type in pokemon.types!){
        listTypes.add(await getType(type.id));
      }
      pokemon.types = listTypes;
      return pokemon;
    } finally {
      http.Client().close();
    }
  }

  Future<List<PokemonType>> getAllType() async{
    try{
      var url = criaUri('/api/v2/type');
      var response = await http.Client().get(url);
      Map<String, dynamic> data = json.decode(response.body);
      List<PokemonType> listTypes = [];
      for(var data in data['results']){
        if(int.parse(data['url'].toString().replaceAll(RegExp(r'[^0-9]'), '').substring(1)) < 1000) {
          listTypes.add(PokemonType.fromBasicJson(data));
        }
      }
      return listTypes;
    }finally{
      http.Client().close();
    }
  }

  Future<PokemonType> getType(int idType) async{
    try{
      var url = criaUri('/api/v2/type/$idType/');
      var response = await http.Client().get(url);
      Map<String, dynamic> data = json.decode(response.body);
      PokemonType type = PokemonType.fromCompleteJson(data);
      return type;
    }finally{
      http.Client().close();
    }
  }
}
