class PokemonType{
  int id;
  String name;
  List<PokemonType>? doubleDamageFrom;
  List<PokemonType>? halfDamageFrom;
  List<PokemonType>? noDamageFrom;
  List<PokemonType>? doubleDamageTo;
  List<PokemonType>? halfDamageTo;
  List<PokemonType>? noDamageTo;


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
    List<PokemonType> doubleDamageFrom = _listDamage('double_damage_from', data);
    List<PokemonType> halfDamageFrom = _listDamage('half_damage_from', data);
    List<PokemonType> noDamageFrom = _listDamage('no_damage_from', data);
    List<PokemonType> doubleDamageTo = _listDamage('double_damage_to', data);
    List<PokemonType> halfDamageTo = _listDamage('half_damage_to', data);
    List<PokemonType> noDamageTo = _listDamage('no_damage_to', data);
    return PokemonType(
        data['id'],
        data['name'],
        doubleDamageFrom,
        halfDamageFrom,
        noDamageFrom,
        doubleDamageTo,
        halfDamageTo,
        noDamageTo
    );
  }
}
_listDamage(String key, Map<String, dynamic> data){
  List<PokemonType> listTypesDamage = [];
  for(var data in data['damage_relations'][key]){
    listTypesDamage.add(PokemonType.fromBasicJson(data));
  }
  return listTypesDamage;
}