import '../classes/pokemon_type.dart';

class DamageRelations {
  convertDamages(
      List<PokemonType> doubleDamageFrom
      // List<PokemonType> halfDamageFrom,
      // List<PokemonType> noDamageFrom,
      // List<PokemonType> doubleDamageTo,
      // List<PokemonType> halfDamageTo,
      // List<PokemonType> noDamageTo
      ){
    Map<String,double> damagesFrom = { for (var damage in doubleDamageFrom) damage.name : 2 };
  }

  weaknesses(
      List<PokemonType> doubleDamageFrom,
      List<PokemonType> halfDamageFrom,
      List<PokemonType> noDamageFrom,
      List<PokemonType> doubleDamageTo,
      List<PokemonType> halfDamageTo,
      List<PokemonType> noDamageTo) {

  }
}
