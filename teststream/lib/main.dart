import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(TestStream());
}

StreamController<String> streamController = StreamController();

class TestStream extends StatefulWidget {
  // const TestStream({ Key? key }) : super(key: key);

  @override
  _TestStreamState createState() => _TestStreamState();
}

class _TestStreamState extends State<TestStream> {
  Stream<String> myStream;

  @override
  void initState() {
    super.initState();
    myStream = streamController.stream;
    Timer(Duration(microseconds: 3000), () {
      streamController.sink.add("first value");
    });
    Timer(Duration(microseconds: 5000), () {
      streamController.sink.add("next value");
    });
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder<String>(
            stream: myStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(snapshot.data,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    RaisedButton(
                      child: Text("Add Stream"),
                      onPressed: () {
                        DateTime date = DateTime.now();
                        streamController.sink.add(date.toIso8601String());
                      },
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}