abstract class PokemonEvent {}

class PokemonPageRequest extends PokemonEvent {
  final int page; //pagina.
  PokemonPageRequest({required this.page});
}
