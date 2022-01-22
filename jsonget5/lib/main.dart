import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
  .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //Use the compute function to run parsePhotos in a separate isolate.
  print("response.body = ${response.body}");
  print("parsePhotos = ${parsePhotos}");
  print("compute(parsePhotos, response.body ) = ${compute(parsePhotos, response.body)}");
  return compute(parsePhotos, response.body);
}


//Afunction that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody){
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Photo>>(
        future:fetchPhotos(http.Client()) ,
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return const Center(
              child: Text('An error has occurred!'),
            );
          }else if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(snapshot.data![i].title),
              );
            }, );
            // return Text("has data");
          } else {
            return const Center(
              child: CircularProgressIndicator() ,
              );
          }
        },),
    );
  }
}