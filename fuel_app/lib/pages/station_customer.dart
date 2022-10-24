import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class StationRegistration extends StatefulWidget {
  const StationRegistration({Key? key}) : super(key: key);

  @override
  State<StationRegistration> createState() => _StationRegistrationState();
}

class _StationRegistrationState extends State<StationRegistration> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    var stationID = "";
    var name = "";
    var ownerName = "";
    var location = "";
    var password = "";
    return Scaffold(
        appBar: AppBar(
            //   title: const Text('Station Registration'),
            ),
        body: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "SignUp as a Fuel Station",
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
                      hintText: "Station ID",
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    stationID = value;
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
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    name = value;
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
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      hintText: "Owner Name",
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    ownerName = value;
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
                  cursorColor: Color(0xff14DDAF),
                  decoration: InputDecoration(
                      hintText: "Location",
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (value) {
                    location = value;
                  },
                ),
              ),Container(
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
              ),SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      print("hereeeeee");
                    },
                    color: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
