import 'package:flutter/material.dart';
import 'package:app/detailsAll/popupKey.dart';
import 'dart:convert';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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

// ////////////////

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text(''),
//           content: const Text('Now, super-cute keyboard application is available! Emoticon Keyboard can make your phone more cute.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'CLOSE'),
//               child: const Text('CLOSE'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'TRY FOR FREE'),
//               child: const Text('TRY FOR FREE'),
//             ),
//           ],
//         ),
//       ),
//       child: const Icon(Icons.keyboard_outlined),
      
//     );
    
//   }
// }
