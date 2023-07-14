import 'package:flutter/material.dart';
import 'package:pokedex_app/Api/api_pokedex.dart';
import 'package:pokedex_app/Widgets/card_type.dart';
import 'package:pokedex_app/classes/pokemon_type.dart';

class TypeListView extends StatefulWidget {
  const TypeListView({super.key});

  @override
  State<TypeListView> createState() => _TypeListViewState();
}

class _TypeListViewState extends State<TypeListView> {

  List<PokemonType> listType = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiPokedex().getAllType(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            listType = snapshot.data!;
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1,
                      ),
                      itemCount: listType.length,
                      itemBuilder: (context, index) {
                        return CardType(type: listType[index],);
                      },
                    ),
                  ),
                ],
              ),
            );
          }else{
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }
}
