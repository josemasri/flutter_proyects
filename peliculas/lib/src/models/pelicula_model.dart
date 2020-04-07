class Pelicula {
  String uniqueId;
  double popularity;
  int id;
  bool video;
  int voteCount;
  double voteAverage;
  String title;
  String releaseDate;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String posterPath;

  Pelicula({
    this.popularity,
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) => Pelicula(
        popularity: json["popularity"].toDouble(),
        id: json["id"],
        video: json["video"],
        voteCount: json["vote_count"],
        voteAverage: json["vote_average"].toDouble(),
        title: json["title"],
        releaseDate: json["release_date"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        backdropPath: json["backdrop_path"],
        adult: json["adult"],
        overview: json["overview"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "id": id,
        "video": video,
        "vote_count": voteCount,
        "vote_average": voteAverage,
        "title": title,
        "release_date": releaseDate,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "backdrop_path": backdropPath,
        "adult": adult,
        "overview": overview,
        "poster_path": posterPath,
      };
}
