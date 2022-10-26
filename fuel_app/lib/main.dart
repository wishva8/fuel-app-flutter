/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
import 'package:flutter/material.dart';
import 'package:fuel_app/pages/customer_registration.dart';
import 'package:fuel_app/pages/home_customer.dart';
import 'package:fuel_app/pages/login.dart';
import 'package:fuel_app/pages/station_registration.dart';

//Main function for the app
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color.fromARGB(255, 77, 149, 244)),
    home: Login(),
  ));
}



