import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:thuto_frontend/config/constants/app_strings.dart';
import 'package:thuto_frontend/core/models/user_model.dart';
import 'package:thuto_frontend/core/utils/buttons_utils.dart';
import 'package:thuto_frontend/core/utils/textfield_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String id = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

Future<UserModel> registerScreen(
  String email, 
  String password,
  BuildContext context,
) async {
  var Url = "http://localhost:8080/api/auth/signup";
  var response = await http.post(Url as Uri,
    headers: <String, String>{"Content-Type":"application/json"},
    body: jsonEncode(<String, String>{
      "email" : email,
      "password" : password,
    })
  );
  String responseString = response.body;
  if(response.statusCode == 200) {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (BuildContext dialogContext){
        return MyAlertDialog(title: 'Backend response', content: response.body);
      },
    ); 
  }

  //If backend returns error, throw exception
  throw Exception("Failed to register user: ${response.body}");


}

class _RegisterScreenState extends State<RegisterScreen> {

  //Password visibility
  bool showPassword = false;
  bool showConfirmPassword = false;

  //Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black.withValues(alpha: 0.5),  
                  ), 
                  hintText: AppStrings.EnterUsername, 
                  textEditingController: emailController
                ).emailUsernameTextField(),
                    
                //Password- Password
                TextfieldUtils(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black.withValues(alpha: 0.5),
                  ), 
                  hintText: AppStrings.EnterPassword, 
                  textEditingController: passwordController,
                  isPass: !showPassword,
                ).passwordTextfield(
                  IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword =!showPassword;
                      });
                    },
                  ),
                ),
            
                //Confirm Password
                TextfieldUtils(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black.withValues(alpha: 0.5),
                  ), 
                  hintText: AppStrings.ConfirmPassword, 
                  textEditingController: confirmPasswordController,
                  isPass: !showConfirmPassword,
                ).passwordTextfield(
                  IconButton(
                    icon: Icon(
                      showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        showConfirmPassword =!showConfirmPassword;
                      });
                    },
                  ),
                ),
            
                SizedBox(height: 20,),
            
                //RegisterButton
                ButtonsUtils(
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/HomeScreen');
                    }
                    
                  }, 
                  btnText: "Register",
                ).LoginBtn(),
            
                //Split the login and social media login
                Row(
                  children: <Widget>[
                    //left
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 5.0),
                        child: const Divider(
                          indent: 40,
                          endIndent: 40,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ),
            
                    const Text(
                      "Or register with",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                      ),
                    ),
            
                    //Right
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: const Divider(
                          indent: 40,
                          endIndent: 40,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ),
            
                    
            
                  ],
                ),
            
                //Social media button(Google)
                ButtonsUtils(
                  onPressed: () {}, 
                  btnText: ""
                ).mediaButton(
                  const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  )
                ),
            
                //Do you have an account button?? SignUp
                ButtonsUtils(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  btnText: "Login",
                  
                ).doYouHaveAnAccountBtn(
                  "Already have an account?",
                )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}