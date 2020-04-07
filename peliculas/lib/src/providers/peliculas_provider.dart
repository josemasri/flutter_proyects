import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/credits_res.dart';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/models/pelicula_search_res_model.dart';
import 'package:peliculas/src/models/peliculas_res.dart';

class PeliculasProvider {
  static final String _apikey = 'df787db7d955ae2087a711eb84683589';
  static final String _url = 'api.themoviedb.org';
  static final String _language = 'en-US';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = [];
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  static Future<List<Pelicula>> _procesarRespuesta(Uri uri) async {
    final response = await http.get(uri);
    return peliculasResFromJson(response.body).results;
  }

  static Future<CreditsRes> _procesarRespuestaCredits(Uri uri) async {
    final response = await http.get(uri);
    return creditsResFromJson(response.body);
  }

  static Future<MovieSearchRes> _procesarRespuestaSearch(Uri uri) async {
    final response = await http.get(uri);
    return movieSearchResFromJson(response.body);
  }


  static Uri _getURI(String path, {String page = '1', String movieId = '', String query = ''}) {
    return Uri.https(_url, path, {
      'api_key': _apikey,
      'language': _language,
      'page': page,
      'movie_id': movieId,
      'query': query,
      'include_adult': 'false'
    });
  }

  static Future<List<Pelicula>> getEnCines() async =>
      await _procesarRespuesta(_getURI('/3/movie/now_playing'));

  static Future<CreditsRes> getCredits(int id) async =>
      await _procesarRespuestaCredits(_getURI('/3/movie/$id/credits'));

  

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) {
      return [];
    }
    _cargando = true;
    _popularesPage++;
    final res = await _procesarRespuesta(
        _getURI('/3/movie/popular', page: '$_popularesPage'));
    _populares.addAll(res);
    popularesSink(_populares);
    _cargando = false;
    return res;
  }

  static Future<MovieSearchRes> getSearch(String query) async =>
      await _procesarRespuestaSearch(_getURI('3/search/movie', query: query));

  static String getImg(String posterPath, {String type = 'movie'}) {
    if (type == 'movie') {
      return (posterPath == null)
        ? 'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png'
        : 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return (posterPath == null)
        ? 'https://www.risimaging.com/wp-content/uploads/2015/06/staff-no-avatar-male-500x640.jpg'
        : 'https://image.tmdb.org/t/p/w500$posterPath';
  }
}
