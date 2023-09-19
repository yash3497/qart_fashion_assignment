// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qart_fashion_assignment/utils/colors.dart';

class ProductDetailCard extends StatelessWidget {
  bool isSelected;
  final Map data;
  ProductDetailCard({super.key, this.isSelected = false, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: isSelected ? 5 : 0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.black.withOpacity(.25),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Stack(children: [
              Image.network(
                data["ImageUrl"] ??
                    "https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8amVhbnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
                width: 150,
                height: 150,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.campaign_outlined,
                          color: AppColors.secondary,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dHNoaXJ0fGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60",
                          width: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 150,
                  height: 50,
                  color: AppColors.primary.withOpacity(.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${data['Option']}",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "${data['Color']}",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "${data['MRP']}",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              data['Likeabilty'] > 0
                  ? Icon(Icons.star, size: 18)
                  : data['Likeabilty'] > 1
                      ? Icon(Icons.star, size: 18)
                      : data['Likeabilty'] > 2
                          ? Icon(Icons.star, size: 18)
                          : data['Likeabilty'] > 3
                              ? Icon(Icons.star, size: 18)
                              : data['Likeabilty'] > 4
                                  ? Icon(Icons.star, size: 18)
                                  : SizedBox(),
              Text("(${data['Likeabilty']})"),
            ],
          ),
        ],
      ),
    );
  }
}
