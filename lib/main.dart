import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qart_fashion_assignment/screens/home_screen.dart';
import 'package:qart_fashion_assignment/screens/splash_screen.dart';
import 'package:qart_fashion_assignment/utils/colors.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Qart Fashion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
      home: SplashScreen(),
    );
  }
}
