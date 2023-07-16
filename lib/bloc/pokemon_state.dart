import 'package:pokedex_application/models/pokemon_page_response.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {required this.pokemonListings, required this.canLoadNextPage});
}

class PokemonPageLoadedFailed extends PokemonState {
  // ignore: prefer_typing_uninitialized_variables
  var error;
  PokemonPageLoadedFailed({required this.error});
}
