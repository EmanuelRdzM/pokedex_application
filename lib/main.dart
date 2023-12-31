import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_event.dart';
import 'package:pokedex_application/pokedex_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(primaryColor: Colors.red),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 50)),
          )
        ],
        child: const PokedexView(),
      ),
    );
  }
}
