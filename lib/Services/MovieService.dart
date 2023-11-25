import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:nextion_task/Models/movies_cetailsModel.dart';
import 'package:nextion_task/Models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/const.dart';
import '../Models/FavoritedModel.dart';

//general Provider
var listprovider = Provider<APICalls>((ref) => APICalls());

//RiverpodProviders
var listdateProvider = FutureProvider<MoviesModel>(
    (ref) async => ref.watch(listprovider).getlist());

var detailsdataProvider = FutureProvider.family<MoviesDetailsModel, String>(
    (ref, id) async => ref.watch(listprovider).getdetails(id));

var loadFavProvider = FutureProvider.autoDispose<List<Movie>>((
  ref,
) async =>
    APICalls().getMovies());
var removeFavProvider = FutureProvider.family<void, String>(
    (ref, name) async => APICalls().removeMovie(name));

var savFavProvider = FutureProvider.family<void, List<Movie>>(
    (ref, name) async => APICalls().saveMovies(name));

//Network Calls

class APICalls {
  List<MoviesModel> favlist = [];
  Future<MoviesModel> getlist() async {
    var request = http.Request("GET", Uri.parse(EndPoint.endpoint));
    var headers = {
      "accept": "application/json",
      'Authorization': 'Bearer ${EndPoint.token}'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var date = jsonDecode(await response.stream.bytesToString());
      return MoviesModel.fromJson(date);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<MoviesDetailsModel> getdetails(var id) async {
    var request = http.Request(
        "GET", Uri.parse("https://api.themoviedb.org/3/movie/${id}"));
    var headers = {
      "accept": "application/json",
      'Authorization': 'Bearer ${EndPoint.token}'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var date = jsonDecode(await response.stream.bytesToString());
      return MoviesDetailsModel.fromJson(date);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

//Local Database
  Future<List<Movie>> getMovies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? movieList = prefs.getStringList('movies');

    if (movieList != null) {
      return movieList.map((jsonString) => Movie.fromJson(jsonString)).toList();
    } else {
      throw Exception("list Empty");
    }
  }

  Future<void> removeMovie(String movieName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Movie> existingMovies = await getMovies();

    existingMovies.removeWhere((movie) => movie.name == movieName);

    final List<String> updatedMovieList =
        existingMovies.map((movie) => movie.toJson()).toList();

    prefs.setStringList('movies', updatedMovieList);
  }

  Future<void> saveMovies(List<Movie> newMovies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Movie> existingMovies = await getMovies();

    for (Movie newMovie in newMovies) {
      bool movieExists =
          existingMovies.any((movie) => movie.name == newMovie.name);
      if (!movieExists) {
        existingMovies.add(newMovie);
      }
    }

    final List<String> updatedMovieList =
        existingMovies.map((movie) => movie.toJson()).toList();
    prefs.setStringList('movies', updatedMovieList);
  }
}
