// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart_fashion_assignment/screens/product_detail_screen.dart';
import 'package:qart_fashion_assignment/utils/colors.dart';
import 'package:qart_fashion_assignment/utils/constant.dart';

class ProductWidget extends StatelessWidget {
  final Map data;
  const ProductWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List size = data['EAN'].keys.toList();
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen(
              data: data,
            ));
      },
      child: Row(
        children: [
          Image.network(
            data['ImageUrl'] ??
                "https://static.vecteezy.com/system/resources/previews/008/847/318/non_2x/isolated-black-t-shirt-front-free-png.png",
            width: 90,
            height: 90,
          ),
          WidthBox(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${data['Color']}",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "OP: ${data['Option']}",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                "QR: ${data['QRCode']}",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                "Size: ${size.map((e) => e.toString()).join(',')}",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            "Rs. ${data['MRP']}/-",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
