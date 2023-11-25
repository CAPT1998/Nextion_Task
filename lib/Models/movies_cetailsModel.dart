class MoviesDetailsModel {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MoviesDetailsModel(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    belongsToCollection = json["belongs_to_collection"];
    budget = json["budget"];
    genres = json["genres"] == null
        ? null
        : (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
    homepage = json["homepage"];
    id = json["id"];
    imdbId = json["imdb_id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    productionCompanies = json["production_companies"] == null
        ? null
        : (json["production_companies"] as List)
            .map((e) => ProductionCompanies.fromJson(e))
            .toList();
    productionCountries = json["production_countries"] == null
        ? null
        : (json["production_countries"] as List)
            .map((e) => ProductionCountries.fromJson(e))
            .toList();
    releaseDate = json["release_date"];
    revenue = json["revenue"];
    runtime = json["runtime"];
    spokenLanguages = json["spoken_languages"] == null
        ? null
        : (json["spoken_languages"] as List)
            .map((e) => SpokenLanguages.fromJson(e))
            .toList();
    status = json["status"];
    tagline = json["tagline"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["adult"] = adult;
    _data["backdrop_path"] = backdropPath;
    _data["belongs_to_collection"] = belongsToCollection;
    _data["budget"] = budget;
    if (genres != null) {
      _data["genres"] = genres?.map((e) => e.toJson()).toList();
    }
    _data["homepage"] = homepage;
    _data["id"] = id;
    _data["imdb_id"] = imdbId;
    _data["original_language"] = originalLanguage;
    _data["original_title"] = originalTitle;
    _data["overview"] = overview;
    _data["popularity"] = popularity;
    _data["poster_path"] = posterPath;
    if (productionCompanies != null) {
      _data["production_companies"] =
          productionCompanies?.map((e) => e.toJson()).toList();
    }
    if (productionCountries != null) {
      _data["production_countries"] =
          productionCountries?.map((e) => e.toJson()).toList();
    }
    _data["release_date"] = releaseDate;
    _data["revenue"] = revenue;
    _data["runtime"] = runtime;
    if (spokenLanguages != null) {
      _data["spoken_languages"] =
          spokenLanguages?.map((e) => e.toJson()).toList();
    }
    _data["status"] = status;
    _data["tagline"] = tagline;
    _data["title"] = title;
    _data["video"] = video;
    _data["vote_average"] = voteAverage;
    _data["vote_count"] = voteCount;
    return _data;
  }

  MoviesDetailsModel copyWith({
    bool? adult,
    String? backdropPath,
    dynamic belongsToCollection,
    int? budget,
    List<Genres>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      MoviesDetailsModel(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        belongsToCollection: belongsToCollection ?? this.belongsToCollection,
        budget: budget ?? this.budget,
        genres: genres ?? this.genres,
        homepage: homepage ?? this.homepage,
        id: id ?? this.id,
        imdbId: imdbId ?? this.imdbId,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        productionCountries: productionCountries ?? this.productionCountries,
        releaseDate: releaseDate ?? this.releaseDate,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json["english_name"];
    iso6391 = json["iso_639_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["english_name"] = englishName;
    _data["iso_639_1"] = iso6391;
    _data["name"] = name;
    return _data;
  }

  SpokenLanguages copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguages(
        englishName: englishName ?? this.englishName,
        iso6391: iso6391 ?? this.iso6391,
        name: name ?? this.name,
      );
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json["iso_3166_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["iso_3166_1"] = iso31661;
    _data["name"] = name;
    return _data;
  }

  ProductionCountries copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountries(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    logoPath = json["logo_path"];
    name = json["name"];
    originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["logo_path"] = logoPath;
    _data["name"] = name;
    _data["origin_country"] = originCountry;
    return _data;
  }

  ProductionCompanies copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) =>
      ProductionCompanies(
        id: id ?? this.id,
        logoPath: logoPath ?? this.logoPath,
        name: name ?? this.name,
        originCountry: originCountry ?? this.originCountry,
      );
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }

  Genres copyWith({
    int? id,
    String? name,
  }) =>
      Genres(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
