import 'dart:async';

import 'package:excess_edu/config/app_config.dart';
import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/consts/images.dart';
import 'package:excess_edu/utils/routes.dart';
import 'package:excess_edu/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.foregroundColor,
      body: Center(
        child: Container(
          height: 70,
          width: 70,
          child: Center(
            child: Image.asset(AppConfig.splashLogo),
          ),
        ),
      ),
    );
  }
}
