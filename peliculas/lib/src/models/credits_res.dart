import 'dart:convert';

import 'package:peliculas/src/models/cast.dart';
import 'package:peliculas/src/models/crew.dart';

CreditsRes creditsResFromJson(String str) => CreditsRes.fromJson(json.decode(str));

String creditsResToJson(CreditsRes data) => json.encode(data.toJson());

class CreditsRes {
  int id;
  List<Cast> cast;
  List<Crew> crew;

  CreditsRes({
    this.id,
    this.cast,
    this.crew,
  });

  factory CreditsRes.fromJson(Map<String, dynamic> json) => CreditsRes(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}
