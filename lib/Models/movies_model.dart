class MoviesModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MoviesModel({this.page, this.results, this.totalPages, this.totalResults});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    if (results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    _data["total_pages"] = totalPages;
    _data["total_results"] = totalResults;
    return _data;
  }

  MoviesModel copyWith({
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviesModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    genreIds =
        json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["adult"] = adult;
    _data["backdrop_path"] = backdropPath;
    if (genreIds != null) {
      _data["genre_ids"] = genreIds;
    }
    _data["id"] = id;
    _data["original_language"] = originalLanguage;
    _data["original_title"] = originalTitle;
    _data["overview"] = overview;
    _data["popularity"] = popularity;
    _data["poster_path"] = posterPath;
    _data["release_date"] = releaseDate;
    _data["title"] = title;
    _data["video"] = video;
    _data["vote_average"] = voteAverage;
    _data["vote_count"] = voteCount;
    return _data;
  }

  Results copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      Results(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );
}
