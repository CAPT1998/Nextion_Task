import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextion_task/Helpers/Widgets/Drawer.dart';
import 'package:nextion_task/Views/FavoriteMovie_Screen.dart';
import '../Models/FavoritedModel.dart';
import '../Services/MovieService.dart';
import 'MovieDetailScreen.dart';

class MovieListWidget extends ConsumerStatefulWidget {
  const MovieListWidget({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    var data = ref.watch(listdateProvider);
    var favdata = ref.watch(loadFavProvider);

    return SafeArea(
      child: Scaffold(
          drawer: const CustomDrawer(),
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => FavListWidget()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: data.when(
            data: (e) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 0.0,
                ),
                itemCount: e.totalResults,
                itemBuilder: (BuildContext context, int index) {
                  var moviedata = e.results!.elementAt(index);

                  bool isFavorite = favdata.asData?.value.any((favoriteMovie) =>
                          favoriteMovie.name ==
                          data.asData!.value.results![index].originalTitle) ??
                      false;

                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  MovieDetails(id: moviedata.id.toString()),
                            ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.5, color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: Colors.black),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          "https://image.tmdb.org/t/p/w500/${moviedata.backdropPath}",
                                          height: 100.h,
                                          width: 150.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.favorite,
                                      color: isFavorite
                                          ? Colors.red
                                          : Colors.white),
                                  onPressed: () async {
                                    if (isFavorite) {
                                      await ref.read(removeFavProvider(
                                          moviedata.originalTitle.toString()));
                                    } else {
                                      List<Movie> movies = [
                                        Movie(
                                            name: moviedata!.originalTitle!,
                                            imageUrl: moviedata.backdropPath!),
                                      ];

                                      await ref.read(savFavProvider(movies));
                                    }
                                    ref.invalidate(loadFavProvider);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Text(
                                moviedata.originalTitle!,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              print(error.toString());
            },
            loading: () {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            },
          )),
    );
  }
}
