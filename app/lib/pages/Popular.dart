import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:app/pages/Popular.dart';
import 'package:app/pages/Fav.dart';
import 'package:app/pages/EveryOne.dart';
import 'package:app/pages/PickUp.dart';
import 'package:app/pages/History.dart';
import 'package:app/detailsAll/detPop.dart';
import 'package:app/detailsAll/popupKey.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  int _currentIndex = 1;
  final tabs = [Fav(), EveryOne(), Popular(), PickUp(), History()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: ()
         {
          print("Key detail page >>");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PopupKey()));
        },
        backgroundColor: Color(0xffe85d9c),
        child: const Icon(Icons.keyboard_outlined),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String img_url) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(5),
      // height: 150,
      decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(0),
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
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal)),
          Text("____________________________________________________",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black12,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            height: 0.25,
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 0.25,
          ),
          // TextButton(
          //     onPressed: () {
          //       print("Next page >>");
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => DetPop()));
          //     },
          //     child: Text("read more"))
        ],
      ),
    );
  }
}
