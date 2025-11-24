import 'package:flutter/material.dart';
import 'package:thuto_frontend/config/constants/app_colors.dart';

class ButtonsUtils {

  final VoidCallback onPressed; //Function to handle button pressed
  final String btnText;

  ButtonsUtils({
    required this.onPressed,
    required this.btnText,
  });

  //Login Button
  Container LoginBtn(){
    return Container(
      margin: EdgeInsets.all(40),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 70),
          backgroundColor: AppColors.secondary,
          minimumSize: Size(double.infinity, 50)
        ),
        child: Text(
          btnText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
    );
  }


}