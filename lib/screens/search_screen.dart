import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart_fashion_assignment/backend/api/product_api.dart';
import 'package:qart_fashion_assignment/utils/constant.dart';

import '../utils/colors.dart';
import '../widgets/product_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.put(ProductApiCalling()).updateData();
        Get.back();
        return false;
      },
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'search',
                child: TextFormField(
                  onChanged: (value) {
                    Get.put(ProductApiCalling()).searchProduct(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(left: 20),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              HeightBox(20),
              Text(
                "Results",
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
                    return Flexible(
                      child: ListView.separated(
                        itemCount: controller.produtList.length,
                        shrinkWrap: true,
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
                      ),
                    );
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
