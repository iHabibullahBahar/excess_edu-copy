import 'package:excess_edu/views/pages/buy_course_page.dart';
import 'package:excess_edu/views/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '/utils/routes.dart';
import '/views/pages/course_details_page.dart';
import '/views/pages/drawer_pages/account_information_page.dart';
import '/views/pages/drawer_pages/payment_and_order_history_page.dart';
import '/views/pages/drawer_pages/terms_and_condition_page.dart';
import '/views/pages/front_page.dart';
import '/views/pages/home_page.dart';
import '/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/user_model.dart';
import 'services/auth.dart';
import 'utils/theme/theme.dart';
import 'views/pages/drawer_pages/about_us_page.dart';
import 'views/pages/drawer_pages/contact_us_page.dart';
import 'views/pages/drawer_pages/my_certificates_page.dart';
import 'views/pages/drawer_pages/privacy_policy_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        //darkTheme: ThemeData(brightness: Brightness.light),
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          "/": (context) => Wrapper(),
          //"/": (context) => SplashScreen(),
          //"/": (context) => const FrontPage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.frontPageRoute: (context) => const FrontPage(),

          //Drawer Page Routes
          MyRoutes.accountInformationRoute: (context) =>
              AccountInformationPage(),
          MyRoutes.paymentAndOrderHistoryRoute: (context) =>
              PaymentAndOrderHistoryPage(),
          MyRoutes.myCertificatesRoute: (context) => MyCertificatesPage(),
          MyRoutes.aboutUsRoute: (context) => AboutUsPage(),
          MyRoutes.contactUsRoute: (context) => ContactUsPage(),
          MyRoutes.privacyPolicyRoute: (context) => PrivacyPolicyPage(),
          MyRoutes.termsAndConditionsRoute: (context) =>
              const TermsAndConditionPage(),
        },
      ),
    );
  }
}
