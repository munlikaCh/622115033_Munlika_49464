import 'package:flutter/material.dart';

class DetPop extends StatefulWidget {
  const DetPop({ Key? key }) : super(key: key);

  @override
  _DetPopState createState() => _DetPopState();
}

class _DetPopState extends State<DetPop> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Details"),),
        body: ListView(
          children: [
            Text("Details Explanation")
          ],
        )
    );
  }
}