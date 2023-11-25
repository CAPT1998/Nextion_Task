// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Services/MovieService.dart';

class FavListWidget extends ConsumerStatefulWidget {
  const FavListWidget({super.key});

  @override
  _FavListWidgetState createState() => _FavListWidgetState();
}

class _FavListWidgetState extends ConsumerState<FavListWidget> {
  @override
  Widget build(BuildContext context) {
    var data = ref.watch(loadFavProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_sharp)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Favorites",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: data.asData!.value.isEmpty
          ? const Center(
              child: Text(
              "No Favorites added",
              style: TextStyle(color: Colors.white),
            ))
          : data.when(
              data: (favdata) {
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 0.0,
                  ),
                  itemCount: favdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("length is" + favdata.length.toString());
                    var moviedata = favdata!.elementAt(index);
                    return favdata.length == 0
                        ? const Center(
                            child: Text("No Favorites"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.5,
                                                  color: Colors.white),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                              color: Colors.black),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  "https://image.tmdb.org/t/p/w500/${moviedata.imageUrl}",
                                                  height: 100.h,
                                                  width: 150.w,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      moviedata.name!,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 15.0, color: Colors.white),
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
            ),
    ));
  }
}
