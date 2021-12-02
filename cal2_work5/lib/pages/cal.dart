import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  TextEditingController quantity = TextEditingController();
  // double price = 100;
  TextEditingController price = TextEditingController();
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result.text =
        "Buy x Baka. Because each Baka cost x THB, you have to pay x THB";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/Baka.png",
                  width: 224,
                  // height: 280,
                ),
                SizedBox(
                  height: 20,
                ),
                // Text("Picture"),
                Text(
                  "Calculate Program",
                  style: TextStyle(
                      fontFamily: "pphometowntest",
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.withOpacity(0.3)),
                ),
                TextField(
                  controller: quantity,
                  decoration: InputDecoration(
                      labelText: "Buy Bake", border: OutlineInputBorder()),
                ),
                TextField(
                  controller: price,
                  decoration: InputDecoration(
                      labelText: "Price Baka", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var cal =
                        double.parse(quantity.text) * double.parse(price.text);
                    print("Baka quality: ${quantity.text} Total: ${cal} THB");
                    setState(() {
                      result.text =
                          "Buy ${quantity.text} Baka. Because each Baka cost ${price.text} THB, you have to pay ${cal} THB";
                    });
                  },
                  child: Text("Calculate"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffAFCBFF)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(10, 30, 50, 70)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontFamily: "pphometowntest", fontSize: 20))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(result.text)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
