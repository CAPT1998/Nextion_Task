// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextion_task/main.dart';

import '../Services/MovieService.dart';

class MovieDetails extends ConsumerWidget {
  final String id;

  const MovieDetails({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(detailsdataProvider(id));

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_sharp)),
          backgroundColor: Colors.transparent,
          title: Text(
            "Details",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: data.when(
          data: (data) {
            return ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${data.backdropPath}',
                      height: 300,
                      width: 200,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    data.originalTitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Release Date :',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${data.releaseDate.toString()}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Overview:',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${data.overview}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Genres:',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${data.genres![0].name}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tagline:',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${data.tagline}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]);
          },
          error: (error, stackTrace) {
            throw Exception(error.toString());
          },
          loading: () {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          },
        ));
  }
}
