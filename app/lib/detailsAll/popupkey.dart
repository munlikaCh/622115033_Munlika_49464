import 'package:flutter/material.dart';

class PopupKey extends StatefulWidget {
  const PopupKey({Key? key}) : super(key: key);

  @override
  _PopupKeyState createState() => _PopupKeyState();
}

class _PopupKeyState extends State<PopupKey> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(''),
          // content: const Text('Now, super-cute keyboard application is available! Emoticon Keyboard can make your phone more cute.(´ ˘ `)❤️'),
          content: Column(
            children: [
              const Text(
                  'Now, super-cute keyboard application is available! Emoticon Keyboard can make your phone more cute.(´ ˘ `)❤️'),
              Image.asset('assets/icons/PicB.png',
                  width: 1000, fit: BoxFit.cover),
            ],
          ),
          actions: <Widget>[
            // Image.asset('assets/icons/PicB.png',width: 150,height: 150, alignment: Alignment.center),
            TextButton(
              onPressed: () => Navigator.pop(context, 'CLOSE'),
              child: const Text('CLOSE'),
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'TRY FOR FREE'),
              child: const Text('TRY FOR FREE'),
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          ],
        ),
      ),
      
      child: const Text('Click here!',
          style: TextStyle(
            color: Color(0xffe85d9c),
            // backgroundColor: Colors.pink,
          )),
    );
  }
}
