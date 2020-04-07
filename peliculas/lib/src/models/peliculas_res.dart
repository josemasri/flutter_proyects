import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

PeliculasRes peliculasResFromJson(String str) =>
    PeliculasRes.fromJson(json.decode(str));

String peliculasResToJson(PeliculasRes data) => json.encode(data.toJson());

class PeliculasRes {
  List<Pelicula> results;
  int page;
  int totalResults;
  int totalPages;

  PeliculasRes({
    this.results,
    this.page,
    this.totalResults,
    this.totalPages,
  });

  factory PeliculasRes.fromJson(Map<String, dynamic> json) => PeliculasRes(
        results: List<Pelicula>.from(
            json["results"].map((x) => Pelicula.fromJson(x))),
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
      };
}
