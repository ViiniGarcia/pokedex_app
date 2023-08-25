class TypeDamage{
  int id;
  String name;
  double damage;

  TypeDamage(this. id, this.name, this.damage);

  factory TypeDamage.fromJson(Map<String, dynamic> data, damage){
    return TypeDamage(
      int.parse(data['url'].toString().replaceAll(RegExp(r'[^0-9]'), '').substring(1)),
      data['name'],
      damage
    );
  }
}

