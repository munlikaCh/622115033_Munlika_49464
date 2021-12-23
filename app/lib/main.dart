import 'package:flutter/material.dart';

import 'package:app/pages/Popular.dart';
import 'package:app/pages/Fav.dart';
import 'package:app/pages/EveryOne.dart';
import 'package:app/pages/PickUp.dart';
import 'package:app/pages/History.dart';

void main() {
  runApp(const MyApp());
}
// cached_sharp 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoticon Dictionary((o(^o^)o))',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  int _currentIndex = 0;
  final tabs = [Fav(), EveryOne(), Popular(), PickUp(), History()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe85d9c),
        title:
          Text(
            "Emoticon Dictionary((o(^o^)o))",
              style: TextStyle(
                fontSize: 20, color: Colors.white)
        ),
         actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cached_sharp),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Updated')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Setting'),
                      backgroundColor: Color(0xffe85d9c),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the setting page',
                        style: TextStyle(fontSize: 24),
                        
                      ),
                    ),
                  );
                },
              ));
            },
          ),
          PopupMenuButton(
                icon: Icon(Icons.more_vert_rounded),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Login"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Logout"),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text("Premium User"),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text("Share & Register"),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text("Add Category"),
                    value: 5,
                  ),
                  PopupMenuItem(
                    child: Text("Delete Mode"),
                    value: 6,
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: 7,
                  ),
                  PopupMenuItem(
                    child: Text("Backup to Internet"),
                    value: 8,
                  ),
                  PopupMenuItem(
                    child: Text("Restore to Internet"),
                    value: 9,
                  ),
                  PopupMenuItem(
                    child: Text("Backup to SD"),
                    value: 10,
                  ),
                  PopupMenuItem(
                    child: Text("Restore from SD"),
                    value: 11,
                  )
                ]
            )
          // IconButton(
          //   icon: const Icon(Icons.more_vert_rounded),
          //   tooltip: 'Show Snackbar',
            
          //   onPressed: () {
              
          //     // ScaffoldMessenger.of(context).showSnackBar(
          //     //     const SnackBar(content: Text('This is a snackbar')));
          //   },
          // ),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white24,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star_rate_rounded), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded), label: "Everyone"), 
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Popular"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up_off_alt_rounded), label: "Pick up"),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_rounded), label: "History"),
        ],
        // backgroundColor: Colors.black,
        selectedItemColor: Colors.white70,
        backgroundColor: Color(0xffe85d9c),
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
