import 'dart:html';

import 'package:flutter/material.dart';
import 'package:listtile/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(1000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    List mydata = ['apple', 'banana', 'papaya'];
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const DetailsPage()));
              },
              leading: FlutterLogo(),
              title: Text(mydata[index]),
            ));
          },
          itemCount: mydata.length,
        )

        // (
        //     // Center is a layout widget. It takes a single child and positions it
        //     // in the middle of the parent.
        //     children: [
        //       ListTile(
        //         onTap: () {},
        //         leading: Icon(Icons.map),
        //         title: Text(mydata[0]),
        //       ),
        //       Text("Hello List tile"),
        //       Icon(Icons.local_movies),
        //       ListTile(
        //         onTap: () {},
        //         leading: Icon(Icons.phone),
        //         title: Text(mydata[1]),
        //       ),
        //       ListTile(
        //         onTap: () {},
        //         leading: FlutterLogo(),
        //         title: Text(mydata[2]),
        //         subtitle: Text("Hello AJ tui"),
        //         trailing: Icon(
        //           Icons.delete,
        //           color: Colors.red,
        //         ),
        //       )
        //     ]), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
