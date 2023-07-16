import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_event.dart';
import 'package:pokedex_application/bloc/pokemon_state.dart';
import 'package:pokedex_application/models/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    // estado inicial
    on<PokemonPageRequest>((event, emit) async {
      emit(PokemonLoadInProgress());
      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPage(event.page);
        emit(PokemonPageLoadSuccess(
            pokemonListings: pokemonPageResponse.pokemonListings,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage));
      } catch (e) {
        emit(PokemonPageLoadedFailed(error: e));
      }
    });
  }
}
