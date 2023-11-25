import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextion_task/Views/MovieListWidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateuser();
  }

  void navigateuser() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => MovieListWidget(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset("assets/images/logo.png", width: 250, height: 250),
      ),
    );
  }
}
