import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            MyBox(Icons.keyboard_arrow_down_rounded, " Others"),
            const SizedBox(
              height: 2,
              child: const DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black12),
              ),
            ),
            MyBox(Icons.keyboard_arrow_down_rounded, " Happy"),
            const SizedBox(
              height: 2,
              child: const DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black12),
              ),
            ),
            MyBox(Icons.keyboard_arrow_down_rounded, " Angry"),
            const SizedBox(
              height: 2,
              child: const DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black12),
              ),
            ),
            MyBox(Icons.keyboard_arrow_down_rounded, " Sad"),
            const SizedBox(
              height: 2,
              child: const DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black12),
              ),
            ),
            MyBox(Icons.keyboard_arrow_down_rounded, " Fun"),
            const SizedBox(
              height: 2,
              child: const DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black12),
              ),
            ),
            MyBox(Icons.keyboard_arrow_down_rounded, " Cute"),
            const SizedBox(
              height: 2,
              child: const DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget MyBox(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 55,
      decoration: BoxDecoration(color: Color(0xffF1F8F1)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            Row(
              children: [
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 21,
              color: Colors.black38,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 19, color: Colors.black),
            ),])
          ]),
    );
  }
}
