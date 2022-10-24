import 'package:flutter/material.dart';

class HomeCustomer extends StatefulWidget {
  const HomeCustomer({ Key? key }) : super(key: key);

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
    );
  }
}