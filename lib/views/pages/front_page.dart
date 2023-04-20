import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/views/pages/downloads.dart';
import 'package:excess_edu/views/pages/home_page.dart';
import 'package:excess_edu/views/pages/my_courses_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'all_courses_page.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int index = 0;
  final screens = [
    HomePage(),
    AllCourcesPage(),
    MyCourcesPage(),
    DownloadsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(indicatorColor: Colors.transparent),
        child: NavigationBar(
          backgroundColor: Colors.white,
          elevation: 9,
          height: 60,
          selectedIndex: index,
          shadowColor: Colors.amber,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home,
                color: AppColors.primaryColor,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(
                Icons.menu_book,
                color: AppColors.primaryColor,
              ),
              label: "All Courses",
            ),
            NavigationDestination(
              icon: Icon(Icons.my_library_books_outlined),
              selectedIcon: Icon(
                Icons.my_library_books,
                color: AppColors.primaryColor,
              ),
              label: "My Courses",
            ),
            NavigationDestination(
              icon: Icon(Icons.download_for_offline_outlined),
              selectedIcon: Icon(
                Icons.download_for_offline,
                color: AppColors.primaryColor,
              ),
              label: "Downloads",
            ),
          ],
        ),
      ),
    );
  }
}
