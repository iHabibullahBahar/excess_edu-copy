import 'package:excess_edu/consts/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/sizes.dart';
import '../../models/course_details_model/course_model.dart';
import 'package:excess_edu/consts/colors.dart';

enum PaymentMethod { SSLCOMMERZ, PersonalPay }

class BuyCoursePage extends StatefulWidget {
  final Course course;

  const BuyCoursePage({Key? key, required this.course}) : super(key: key);

  @override
  State<BuyCoursePage> createState() => _BuyCoursePageState();
}

class _BuyCoursePageState extends State<BuyCoursePage> {
  final TextEditingController _couponController = TextEditingController();
  bool _isCouponApplied = false;
  PaymentMethod? _paymentMethod;
  double padding = AppsSizeConfigs.defaultPadding + 2;
  double horizontalPadding = 16;

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.course.price;

    // If the user has applied a coupon code, then calculate the discounted price.
    if (_isCouponApplied) {
      // Calculate the discounted price based on the coupon code entered by the user
      // and update the totalPrice variable.
      // For example:
      // if (_couponController.text == "DISCOUNT10") {
      //   totalPrice *= 0.9; // 10% discount
      // }
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Buy Now",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 10,
            ),
            // Course Details Card Here
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: padding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.course.name,
                            style: TextStyle(),
                            textScaleFactor: 1.1,
                          ),
                          Text(
                            widget.course.price.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 140,
                      child: Image.network(
                        widget.course.coverImage,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
            ),

            //Coupon Code Card Here
            Container(
              height: 60,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: padding),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Add Cupon',
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isCouponApplied = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 30),
                          backgroundColor: AppColors.primaryColor),
                      child: Text("Reedem"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
            ),

            //Payment Method Selection Here
            Container(
              color: Colors.white,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Payment Method",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(children: <Widget>[
                      RadioListTile<PaymentMethod>(
                        title: Text('SSLCOMMERZ'),
                        value: PaymentMethod.SSLCOMMERZ,
                        groupValue: _paymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                        secondary: Icon(Icons.credit_card),
                      ),
                      RadioListTile<PaymentMethod>(
                        title: Text('Personal Payment'),
                        value: PaymentMethod.PersonalPay,
                        groupValue: _paymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                        secondary: Icon(Icons.person),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            //Order Summary Card Here
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.course.price.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _isCouponApplied ? "0" : "0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          totalPrice.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //Bottom Navigation Bar Here Where Payment Button and total price is shown
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "${widget.course.priceUnit} ${widget.course.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment
                  if (_paymentMethod != null) {
                    print('Selected Payment Method: $_paymentMethod');
                  } else {
                    print('Please select a payment method');
                  }
                },
                child: Text('Make Payment'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(120, 45),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
