// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qart_fashion_assignment/utils/colors.dart';
import 'package:qart_fashion_assignment/utils/constant.dart';
import 'package:qart_fashion_assignment/widgets/custom_input_box.dart';
import 'package:qart_fashion_assignment/widgets/product_detail_card.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map data;
  const ProductDetailScreen({super.key, required this.data});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final brandController = TextEditingController();
  final genderController = TextEditingController();
  final fitController = TextEditingController();
  final offMonthController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brandController.text =
        "${widget.data['Brand']}-${widget.data['Category']}-${widget.data['Collection']}";
    genderController.text =
        "${widget.data['Gender']}-${widget.data['Name']}-${widget.data['SubCategory']}";
    fitController.text =
        "${widget.data['Fit']}-${widget.data['Theme']}-${widget.data['Finish']}";
    offMonthController.text =
        "${widget.data['OfferMonths']}-${widget.data['Mood']}";
    descriptionController.text = "${widget.data['Description']}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.secondary.withOpacity(.8),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "Qart",
          style: TextStyle(
            color: AppColors.secondary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.secondary,
              ),
              child: Center(
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '6 Options (Tap to book)',
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Overall Qty: 0',
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              HeightBox(10),
              SizedBox(
                height: height(context) * .44,
                child: GridView.builder(
                  itemCount: 30,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.33,
                  ),
                  itemBuilder: (context, index) {
                    return ProductDetailCard(
                      data: widget.data,
                      isSelected: index == 2 ? true : false,
                    );
                  },
                ),
              ),
              HeightBox(20),
              Container(
                width: width(context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CustomInputBox(
                      label: "Brand-Category-Collection",
                      controller: brandController,
                    ),
                    HeightBox(10),
                    CustomInputBox(
                      label: "Gender-Name-Subcategory",
                      controller: genderController,
                    ),
                    HeightBox(10),
                    CustomInputBox(
                      label: "Fit-Theme-Finish",
                      controller: fitController,
                    ),
                    HeightBox(10),
                    CustomInputBox(
                      label: "OFF MONTH-MOOD",
                      controller: offMonthController,
                    ),
                  ],
                ),
              ),
              HeightBox(10),
              Container(
                width: width(context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CustomInputBox(
                      label: "Description",
                      controller: descriptionController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
