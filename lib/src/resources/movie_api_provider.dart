import 'dart:convert';

import 'package:bloc_movie/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '9fdbb4b620240e84e477273654e76fea';

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get(Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
