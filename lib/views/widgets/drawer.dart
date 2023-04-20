import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/consts/functions.dart';
import 'package:excess_edu/consts/sizes.dart';
import 'package:excess_edu/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../services/auth.dart';
import 'drawer_widgets/list_Item_maker_widget.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final imageUrl = "https://avatars.githubusercontent.com/u/69121827?v=4";

  double padding = AppsSizeConfigs.defaultPadding;

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: AppColors.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Habibullah Bahar",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.black12,
            ),
            Container(
              //color: Colors.white,
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(padding, padding, 12, 0),
                    child: Row(
                      children: [
                        Text(
                          "Account",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            ConstFunctions.setUserData('', '');
                            _auth.signOut();
                          },
                          child: Text(
                            "Logout",
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListItemMakerWidget(
                      routeName: MyRoutes.accountInformationRoute,
                      label: "Account Information",
                      icon: Icons.account_circle,
                    ),
                  ),
                  Container(
                    child: ListItemMakerWidget(
                        routeName: MyRoutes.paymentAndOrderHistoryRoute,
                        label: "Payment And Order History",
                        icon: Icons.payment_sharp),
                  ),
                  Container(
                    child: ListItemMakerWidget(
                        routeName: MyRoutes.myCertificatesRoute,
                        label: "My Certificates",
                        icon: Icons.fact_check_outlined),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.black12,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(padding, padding, 0, 0),
                        child: Text(
                          "Others",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: ListItemMakerWidget(
                      routeName: MyRoutes.aboutUsRoute,
                      label: "About Us",
                      icon: Icons.info,
                    ),
                  ),
                  Container(
                    child: ListItemMakerWidget(
                      routeName: MyRoutes.contactUsRoute,
                      label: "Contact Us",
                      icon: Icons.contact_phone,
                    ),
                  ),
                  Container(
                    child: ListItemMakerWidget(
                      routeName: MyRoutes.privacyPolicyRoute,
                      label: "Privacy Policy",
                      icon: Icons.privacy_tip,
                    ),
                  ),
                  Container(
                    child: ListItemMakerWidget(
                        routeName: MyRoutes.termsAndConditionsRoute,
                        label: "Terms And Conditions",
                        icon: Icons.verified_user),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Do something
                    },
                    child: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
