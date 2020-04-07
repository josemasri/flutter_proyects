import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

MovieSearchRes movieSearchResFromJson(String str) =>
    MovieSearchRes.fromJson(json.decode(str));

String movieSearchResToJson(MovieSearchRes data) => json.encode(data.toJson());

class MovieSearchRes {
  int page;
  int totalResults;
  int totalPages;
  List<Pelicula> results;

  MovieSearchRes({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory MovieSearchRes.fromJson(Map<String, dynamic> json) => MovieSearchRes(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results:
            List<Pelicula>.from(json["results"].map((x) => Pelicula.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
