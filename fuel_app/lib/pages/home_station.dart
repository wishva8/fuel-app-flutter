/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fuel_app/model/station.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeStation extends StatefulWidget {
  const HomeStation({Key? key}) : super(key: key);

  @override
  State<HomeStation> createState() => _HomeStationState();
}

const String BASE_URL = "https://fuel-app-ead.herokuapp.com";
Map<String, String> headers = {'Content-Type': 'application/json'};

class _HomeStationState extends State<HomeStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Station Dashboard'),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://img.freepik.com/premium-vector/gas-station-scene-white-background_1639-36882.jpg?w=2000",
                        ),
                        fit: BoxFit.fitHeight)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      "My Fuel Station",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 20, right: 0, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Petrol Stock",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton(
                          color: Color.fromARGB(255, 255, 0, 255),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () => {
                            stationFuelUpdate('petrolFinish'),
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Petrol Finish time Updated'),
                                );
                              },
                            )
                          },
                          child: Text("Stock Finish",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () async {
                            stationFuelUpdate('petrolArrival');
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Petrol Arrivel time Updated'),
                                );
                              },
                            );
                          },
                          color: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Stock Arrived",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 20, right: 00, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Disel Stock",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () => {
                            stationFuelUpdate('dieselFinish'),
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Diesel Finish time Updated'),
                                );
                              },
                            )
                          },
                          child: Text("Stock Finish",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () => {
                            stationFuelUpdate('dieselArrival'),
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Diesel Arrival time Updated'),
                                );
                              },
                            )
                          },
                          color: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Stock Arrived",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void stationFuelUpdate(updatedItem) async {
    final prefs = await SharedPreferences.getInstance();
    var stationID = await prefs.getString("stationID");
    var location = await prefs.getString("location");

    var client = getClient();
    var uri = BASE_URL +
        "/fuel/" +
        updatedItem +
        "?stationID=" +
        stationID! +
        "&location=" +
        location!;
    try {
      var response = await client.post(Uri.parse(uri), headers: headers);
    } catch (e) {
      print(e);
    }
  }

  http.Client getClient() {
    return http.Client();
  }
}
