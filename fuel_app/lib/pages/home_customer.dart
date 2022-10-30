/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fuel_app/model/station_stat.dart';
import 'package:fuel_app/pages/station_stat.dart';
import 'package:search_page/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeCustomer extends StatefulWidget {
  const HomeCustomer({Key? key}) : super(key: key);

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  final _debouncer = Debouncer();

  List<StationStat> ulist = [];
  List<StationStat> stationLists = [];

  //API call for All StationStat List
  String url = "https://fuel-app-ead.herokuapp.com";

  Future<List<StationStat>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url + "/fuel/getStations"));
      if (response.statusCode == 200) {
        // print(response.body);
        List<StationStat> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Decode the body and rearrenged the data
  static List<StationStat> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<StationStat>((json) => StationStat.fromJson(json))
        .toList();
  }

  //Initial API call
  @override
  void initState() {
    super.initState();
    getAllulistList().then((StationStatFromServer) {
      setState(() {
        ulist = StationStatFromServer;
        stationLists = ulist;
      });
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Fuel Stations',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed StationStat
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: InkWell(
                  child: Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    stationLists = ulist
                        .where(
                          (u) => (u.location.toLowerCase().contains(
                                string.toLowerCase(),
                              )),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: stationLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            stationLists[index].location,
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            "Petrol waiting Time: " +
                                (stationLists[index].petrol == 1
                                    ? stationLists[index]
                                            .petrolWaitingTime
                                            .toString() +
                                        " min"
                                    : "No Fuel") +
                                "\nDiesel waiting Time: " +
                                (stationLists[index].diesel == 1
                                    ? stationLists[index]
                                            .dieselWaitingTime
                                            .toString() +
                                        " min"
                                    : "No Fuel"),
                            style: TextStyle(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StationDetails(
                                    station: stationLists[index]),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
