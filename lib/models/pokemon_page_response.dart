/*
count:1281
next:"https://pokeapi.co/api/v2/pokemon?offset=53&limit=50"
previous:"https://pokeapi.co/api/v2/pokemon?offset=0&limit=3"
result [
  {name:"charmander"
  url:"https://pokeapi.co/api/v2/pokemon/4/"}
  {name:"charmeleon"
  url:"https://pokeapi.co/api/v2/pokemon/5/"}
]
*/

class PokemonListing {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonListing({required this.id, required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse(
      {required this.pokemonListings, required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson))
        .toList();

    return PokemonPageResponse(
        pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
