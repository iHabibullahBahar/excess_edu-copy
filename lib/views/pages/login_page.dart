import 'package:excess_edu/config/app_config.dart';
import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/consts/images.dart';
import 'package:excess_edu/user_pref/shared_pref.dart';
import 'package:excess_edu/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),

                  //Logo of the app showing here
                  Container(
                    child: Image.asset(AppConfig.logo),
                    height: 100,
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Company name showing here
                  Container(
                    child: Text(
                      AppConfig.companyName,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),

                  SizedBox(
                    width: 250,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        SharedPref.instance.prefs.then((value) {
                          print(value.getString(SharedPref.email));
                        });
                      },
                      label: Text(
                        "Continue with Apple",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.apple,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        elevation: 3,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          dynamic result = await _auth.signInWithGoogle();
                          if (result == null) {
                            print('error signing in');
                          } else {}
                          setState(() {});
                        },
                        label: Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.black),
                        ),
                        icon: Image.asset(
                          AppImages.google_icon,
                          height: 22,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // set the background color
                          elevation: 3,
                          alignment: Alignment.centerLeft,
                        )),
                  ),

                  //Phone Login Here
                  SizedBox(
                    width: 250,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Text(
                          "Continue with Phone",
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Image.asset(
                          AppImages.messege_icon,
                          height: 22,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4D4DFF),
                          elevation: 3,
                          alignment: Alignment.centerLeft,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "*Learn more about ",
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRoutes.frontPageRoute);
                          },
                          child: Text(
                            'terms and conditions',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
