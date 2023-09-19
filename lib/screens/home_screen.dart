import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart_fashion_assignment/backend/api/product_api.dart';
import 'package:qart_fashion_assignment/utils/colors.dart';
import 'package:qart_fashion_assignment/utils/constant.dart';
import 'package:qart_fashion_assignment/widgets/custom_app_bar.dart';
import 'package:qart_fashion_assignment/widgets/home_screen_banner.dart';
import 'package:qart_fashion_assignment/widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(_controller),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeScreenBanner(),
              HeightBox(20),
              Text(
                "Trending Products",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HeightBox(10),
              GetBuilder<ProductApiCalling>(
                  init: ProductApiCalling(),
                  builder: (controller) {
                    return ListView.separated(
                      itemCount: controller.produtList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProductWidget(
                          data: controller.produtList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.grey,
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
