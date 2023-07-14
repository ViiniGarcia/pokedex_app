import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/classes/pokemon.dart';
import 'package:pokedex_app/classes/pokemon_type.dart';

class ApiPokedex {
  var client = http.Client();
  String authority = 'pokeapi.co';

  Uri criaUri(String pathParameters, [Map<String, dynamic>? queryParameters]) {
    return Uri.https(authority, pathParameters, queryParameters);
  }

  Future<List<Pokemon>> getAllPokemon() async {
    try {
      var url = criaUri('/api/v2/pokemon/', {'limit': '1010'});
      var response = await client.get(url);
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
      client.close();
    }
  }

  Future<Pokemon> getPokemon(int idPokemon) async {
    try {
      var url = criaUri('/api/v2/pokemon/$idPokemon/');
      var response = await client.get(url);
      Map<String, dynamic> data = json.decode(response.body);
      Pokemon pokemon = Pokemon.fromJson(data);
      return pokemon;
    } finally {
      client.close();
    }
  }


  Future<List<PokemonType>> getAllType() async{
    try{
      var url = criaUri('/api/v2/type');
      var response = await client.get(url);
      Map<String, dynamic> data = json.decode(response.body);
      List<PokemonType> listTypes = [];
      for(var data in data['results']){
        if(int.parse(data['url'].toString().replaceAll(RegExp(r'[^0-9]'), '').substring(1)) < 1000) {
          listTypes.add(PokemonType.fromJson(data));
        }
      }
      return listTypes;
    }finally{
      client.close();
    }
  }
}
