import 'package:flutter/material.dart';
import 'package:thuto_frontend/config/constants/app_strings.dart';
import 'package:thuto_frontend/core/utils/buttons_utils.dart';
import 'package:thuto_frontend/core/utils/textfield_utils.dart';
import 'package:thuto_frontend/features/auth/presentation/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              //Logo Section
              Container( 
                //height: MediaQuery.of(context).size.height,
                child: Icon(
                    Icons.menu_book_sharp,
                    size: 120,
                    color: Colors.white,
                  ),
              ),
              
              //Username- Email
              TextfieldUtils(
                prefixIcon: Icon(Icons.person), 
                hintText: AppStrings.EnterUsername, 
                textEditingController: emailController
              ).emailUsernameTextField(),
        
              //Password- Password
              TextfieldUtils(
                prefixIcon: Icon(Icons.lock), 
                hintText: AppStrings.EnterPassword, 
                textEditingController: passwordController,
                isPass: true,
              ).passwordTextfield(),

              //Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 14),
                    child: ButtonsUtils(
                      onPressed: () {
                       Navigator.pushNamed(context, '/ForgotPasswordScreen');
                      }, 
                      btnText: "Forgot Password?",
                    ).forgotPwdButton(),
                  ),
                ],
              ),

              //LoginButton
              ButtonsUtils(
                onPressed: () {
                  Navigator.pushNamed(context, '/HomeScreen');
                }, 
                btnText: "Login",
              ).LoginBtn()

              //Line Breaker
            ],
          ),
        ),
      ),
    );
  }
}