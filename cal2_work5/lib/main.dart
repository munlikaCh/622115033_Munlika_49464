
import 'package:cal2/pages/cal.dart';
import 'package:cal2/pages/home.dart';
import 'package:cal2/pages/contact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage()
      );
    }
  }

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  final tabs = [HomePage(), CalculatePage(), ContactPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffAFCBFF),
          title: Text("calculater application",
              style: TextStyle(
                  fontFamily: "pphometowntest", fontSize: 20, color: Colors.white)),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_repair_service_rounded), label: "Homepage"),
            BottomNavigationBarItem(icon: Icon(Icons.calculate_rounded), label: "Calculate"),
            BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact")
          ],
          onTap: (index){
            setState(() {
              print(index);
              _currentIndex = index;
            });
          },
         
        ),
    );
  }
}