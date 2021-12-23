import 'package:flutter/material.dart';

class PopupQa extends StatefulWidget {
  const PopupQa({Key? key}) : super(key: key);

  @override
  _PopupQaState createState() => _PopupQaState();
}

class _PopupQaState extends State<PopupQa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: FractionalOffset.bottomCenter,
      color: Colors.black,
      // child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Scaffold(
            body: ListView(
            children: [Text("Popup detail")],
          )),
        ),
      // ),
    );
  }
}
