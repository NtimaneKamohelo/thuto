import 'package:flutter/material.dart';
import 'package:thuto_frontend/config/constants/app_colors.dart';

class TextfieldUtils{
  Widget prefixIcon;
  // Widget suffixIcon;

  final TextEditingController textEditingController;
   bool isPass;
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
            color: Colors.white10,
            blurRadius: 4,
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
          enabledBorder: OutlineInputBorder( //Border when not focused
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.secondary.withValues(alpha: 0.5),
            )
          ),
          //Border when textfield is focused
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.secondary,
            )
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

  //Password-Textfield
    Container passwordTextfield(Widget? suffixIcon) { 
      return Container( 
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white10,
              blurRadius: 4,
            )
          ]
        ),
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: TextField(
          
          obscureText: isPass,
          controller: textEditingController,
          decoration: InputDecoration(
            fillColor: AppColors.textPrimary,
            contentPadding: const EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder( //Border when not focused
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.secondary.withValues(alpha: 0.5),
            )
          ),
          //Border when textfield is focused
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.secondary,
            )
          ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
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