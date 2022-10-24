import 'package:flutter/material.dart';
import 'package:fuel_app/pages/customer_registration.dart';
import 'package:fuel_app/pages/station_customer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var nic = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      hintText: "NIC",
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    nic = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    onPressed: () async {
                      print("hereeeeee");
                    },
                    color: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerRegistration()));
                    },
                    color: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Register as Customer",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StationRegistration()));
                    },
                    color: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Register as Station Owner",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ));
  }
}
