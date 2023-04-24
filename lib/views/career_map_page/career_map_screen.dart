import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CareerMap extends StatefulWidget{
  const CareerMap({super.key,required this.title});
  final title;
  @override
  State<CareerMap> createState()=>CareerMapState();
}

class CareerMapState extends State<CareerMap> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Career Map'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}