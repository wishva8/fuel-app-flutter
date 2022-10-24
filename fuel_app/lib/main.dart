import 'package:flutter/material.dart';
import 'package:fuel_app/pages/customer_registration.dart';
import 'package:fuel_app/pages/home_customer.dart';
import 'package:fuel_app/pages/login.dart';
import 'package:fuel_app/pages/station_customer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color.fromARGB(255, 77, 149, 244)),
    home: Login(),
  ));
}



