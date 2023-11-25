// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nextion_task/Views/Spash_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //For Responsive Designs
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Nextion Task',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 241, 183, 24)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
