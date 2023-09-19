import 'package:flutter/material.dart';
import 'package:qart_fashion_assignment/utils/colors.dart';

class CustomInputBox extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  const CustomInputBox({super.key, this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primary),
          )),
    );
  }
}
