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
      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
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

  //Forgot password Button
  Container forgotPwdButton() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: TextButton(
        onPressed: onPressed, 
        child: Text(
          btnText,
          style: TextStyle(
            color: AppColors.textPrimary,
          ),
        ) ),
    );
  }

  //Social Media

  


}