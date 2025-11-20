import 'package:flutter/material.dart';
import 'package:thuto_frontend/config/constants/app_colors.dart';

class TextfieldUtils {
  Widget prefixIcon;
  // Widget suffixIcon;

  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;

  //Controller
  TextfieldUtils({
    required this.prefixIcon,
    //required this.suffixIcon,
    required this.hintText,
    required this.textEditingController,
    this.isPass = false,
  });

  //Email Username textfield
  Container emailUsernameTextField() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 60,
          )
        ]
      ),
      margin: const EdgeInsets.only(top:40, left: 20, right: 20),
      child: TextField(
        obscureText: isPass,
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: AppColors.textPrimary,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
          )
        ),
      ),
    );
  }

}