import 'package:excess_edu/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../consts/colors.dart';
import '../widgets/app_bar.dart';

class MyCourcesPage extends StatelessWidget {
  const MyCourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: MyDrawer(),
    );
  }
}
