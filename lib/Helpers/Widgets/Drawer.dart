import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/images/logo.png",
        ),
      ),
    );
  }
}
