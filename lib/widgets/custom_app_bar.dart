// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart_fashion_assignment/backend/api/product_api.dart';
import 'package:qart_fashion_assignment/screens/search_screen.dart';

import '../utils/colors.dart';

PreferredSize CustomAppBar(AnimationController _controller) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 76.0),
    child: AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: Text(
        "Home",
        style: TextStyle(
          color: AppColors.secondary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: child,
              );
            },
            child: InkWell(
                onTap: () {
                  _controller.repeat();
                  Get.put(ProductApiCalling())
                      .callApi()
                      .then((v) => _controller.stop());
                },
                child: Icon(Icons.refresh)),
          ),
        ),
      ],
      flexibleSpace: Column(
        children: [
          SizedBox(height: kToolbarHeight),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Hero(
              tag: 'search',
              child: TextFormField(
                readOnly: true,
                onTap: () {
                  Get.to(() => SearchScreen());
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
          ),
        ],
      ),
    ),
  );
}
