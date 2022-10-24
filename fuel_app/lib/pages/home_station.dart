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
        title: Text('Dashboard'),
      ),
    );
  }
}