import 'dart:convert';

class Movie {
  final String name;
  final String imageUrl;

  Movie({required this.name, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
