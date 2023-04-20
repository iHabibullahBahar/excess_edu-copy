import 'package:excess_edu/views/pages/front_page.dart';
import 'package:excess_edu/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import 'pages/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const LoginPage();
    } else {
      return FrontPage();
    }
  }
}
