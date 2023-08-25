import '../classes/type_damage.dart';


List<TypeDamage> concatAndCalculateDamages(List<TypeDamage> doubleDamage,
    List<TypeDamage> halfDamage, List<TypeDamage> noDamage) {

  final List<TypeDamage> listTypeDamage = [];

  //Transforma listas em um map
  var mapDamages = mappingDamages(doubleDamage, halfDamage, noDamage);

  //Transforma o map em um novo map com os valores calculados
  final newMap = <String, double>{};

  for(var key in mapDamages.keys){
    if(mapDamages[key]!.length.toInt() > 1){
      newMap[key] = calculateDamage(mapDamages[key]![0],mapDamages[key]![1]);
    }else{
      newMap[key] = mapDamages[key]![0];
    }
  }
  newMap.removeWhere((key, value) => value==1);
  newMap.forEach((name, damage) {
    listTypeDamage.add(
        TypeDamage(
            int.parse(name.replaceAll(RegExp(r'[^0-9]'), '')),
            name.replaceAll(RegExp(r'[\d-]'), ''),
            damage
        )
    );
  });
  return listTypeDamage;
}

double calculateDamage(double damage1, double damage2) {
  return damage1*damage2;
}

Map<String, List<double>> mappingDamages(List<TypeDamage> doubleDamage,
    List<TypeDamage> halfDamage, List<TypeDamage> noDamage) {

  final map = <String, List<double>>{};

  for (TypeDamage typeDamage in doubleDamage) {
    addValueToMap(map, typeDamage.name+typeDamage.id.toString(), typeDamage.damage);
  }
  for (TypeDamage typeDamage in halfDamage) {
    addValueToMap(map, typeDamage.name+typeDamage.id.toString(), typeDamage.damage);
  }
  for (TypeDamage typeDamage in noDamage) {
    addValueToMap(map, typeDamage.name+typeDamage.id.toString(), typeDamage.damage);
  }
  return map;
}

void addValueToMap<K, V>(Map<K, List<V>> map, K key, V value) =>
    map.update(key, (list) => list..add(value), ifAbsent: () => [value]);

List<TypeDamage> listDamage(damageRelationsData, double damage) {
  List<TypeDamage> listTypeDamage = [];
  for (var dataDamage in damageRelationsData) {
    listTypeDamage.add(TypeDamage.fromJson(dataDamage, damage));
  }
  return listTypeDamage;
}