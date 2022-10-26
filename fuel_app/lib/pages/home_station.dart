/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
import 'package:flutter/material.dart';

class HomeStation extends StatefulWidget {
  const HomeStation({ Key? key }) : super(key: key);

  @override
  State<HomeStation> createState() => _HomeStationState();
}

class _HomeStationState extends State<HomeStation> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: Text('Station Dashboard'),
      ),
    );
  }
}