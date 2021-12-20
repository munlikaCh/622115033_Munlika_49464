import 'dart:convert';

import 'package:firstapp/pages/details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
              "Differences Between Hiragana and Katakana and Which to Learn First?"),
          backgroundColor: Colors.red[800],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext contect, int index) {
                  return MyBox(data[index]['title'], data[index]['subtitle'],
                      data[index]['image']);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
          ),
        ));
  }

  Widget MyBox(String title, String subtitle, String img_url) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: NetworkImage(img_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 2,
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 2,
          ),
          TextButton(
              onPressed: () {
                print("Next page >>");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage()));
              },
              child: Text("read more"))
        ],
      ),
    );
  }
}
