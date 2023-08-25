import 'package:flutter/material.dart';
import 'package:pokedex_app/Telas/Listas/type_list_view.dart';

import 'listas/pokemon_list_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  
  final _telas=[
    const PokemonListView(),
    const TypeListView(),
    const Text('Movimentos'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.catching_pokemon),
                  selectedIcon: Icon(Icons.catching_pokemon_outlined),
                  label: Text('Pokemons'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.layers_outlined),
                  selectedIcon: Icon(Icons.layers),
                  label: Text('Tipos'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Movimentos'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            _telas[_selectedIndex],
            //const PokemonView(),
          ],
        ),
      ),
    );
  }
}
