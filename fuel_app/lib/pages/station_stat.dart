/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
import 'package:flutter/material.dart';
import 'package:fuel_app/model/station_stat.dart';

class StationDetails extends StatelessWidget {
  final StationStat station;
  const StationDetails({ Key? key,required this.station }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Station detatil'),
      ),
      body: Container(
        child: ListView(
          children: [
            Text(""+station.location)
          ],
        ),
      ),
    );
  }
}