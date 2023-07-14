class PokemonType{
  int id;
  String name;
  String url;


  PokemonType(this.id, this.name, this.url);

  factory PokemonType.fromJson(Map<String, dynamic> data){
    return PokemonType(
        int.parse(data['url'].toString().replaceAll(RegExp(r'[^0-9]'), '').substring(1)),
        data['name'],
        data['url']
    );
  }
}