import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart_fashion_assignment/backend/api/product_api.dart';
import 'package:qart_fashion_assignment/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(ProductApiCalling()).checkDataInLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText('Qart Fashion',
                  speed: const Duration(milliseconds: 100)),
            ],
          ),
        ),
      ),
    );
  }
}
