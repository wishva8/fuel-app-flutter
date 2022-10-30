/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fuel_app/model/station_stat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StationDetails extends StatelessWidget {
  final StationStat station;
  const StationDetails({Key? key, required this.station}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Station detatil'),
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
                height: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/1539637/gas-station-clipart-md.png",
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
                      "Location :  " + station.location,
                      style: TextStyle(fontSize: 20),
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
                      "Petrol Status",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Availability : " + (station.petrol == 1 ? " ✔ " : " ❌ "),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Waiting Time : " +
                          (station.petrol == 1
                              ? station.petrolWaitingTime.toString() + " min"
                              : "No queue"),
                      style: TextStyle(fontSize: 16),
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
                            deparAndExitFuelQueue(
                                station.stationID, "Petrol", "departQueue"),
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text(
                                      'You have Departed from Petrol Queue'),
                                );
                              },
                            )
                          },
                          child: Text("Depart Queue",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () async {
                            enterFuelQueue(station.stationID, "Petrol");
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content:
                                      Text('You have enterd a Petrol Queue'),
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
                            "Enter Queue",
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
                      "Disel Status",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Availability : " + (station.diesel == 1 ? " ✔ " : " ❌ "),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Waiting Time : " +
                          (station.diesel == 1
                              ? station.dieselWaitingTime.toString() + " min"
                              : "No queue"),
                      style: TextStyle(fontSize: 16),
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
                            deparAndExitFuelQueue(
                                station.stationID, "Diesel", "departQueue"),
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text(
                                      'You have Departed from Diesel Queue'),
                                );
                              },
                            )
                          },
                          child: Text("Depart Queue",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () async {
                            enterFuelQueue(station.stationID, "Diesel");
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content:
                                      Text('You have enterd a Diesel Queue'),
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
                            "Enter Queue",
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

  void deparAndExitFuelQueue(stationID, fuelType, updatedItem) async {
    const String BASE_URL = "https://fuel-app-ead.herokuapp.com";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final prefs = await SharedPreferences.getInstance();
    var nic = await prefs.getString("nic");
    var client = getClient();
    var uri = BASE_URL + "/customer/" + updatedItem + "?nic=" + nic!;
    print(uri);
    try {
      var response = await client.post(Uri.parse(uri), headers: headers);
    } catch (e) {
      print(e);
    }
  }

  void enterFuelQueue(stationID, fuelType) async {
    const String BASE_URL = "https://fuel-app-ead.herokuapp.com";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final prefs = await SharedPreferences.getInstance();
    var nic = await prefs.getString("nic");
    var client = getClient();
    var uri = BASE_URL + "/customer/enterQueue";
    var body =
        jsonEncode({"nic": nic, "stationID": stationID, "fuelType": fuelType});
    print(uri);
    print(body);
    try {
      var response = await client.post(
        Uri.parse(uri),
        headers: headers,
        body: body,
      );
    } catch (e) {
      print(e);
    }
  }

  http.Client getClient() {
    return http.Client();
  }
}
