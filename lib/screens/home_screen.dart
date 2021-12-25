import 'dart:convert';

import 'package:alvin_kitchen/screens/login_screen.dart';
import 'package:alvin_kitchen/screens/order_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Widget summary(BuildContext context, price) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    title: const Text('Summary'),
    content: SizedBox(
      height: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tax: Rp. ${(price * 10 / 110).toInt()}'),
          Text('Price: Rp. ${(price - (price * 10 / 110)).toInt()}'),
          Text('Total: Rp. $price')
        ],
      ),
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    ],
  );
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1581781870027-04212e231e96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  'https://images.unsplash.com/photo-1562158074-d49fbeffcc91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1607301406259-dfb186e15de8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1511&q=80',
  'https://images.unsplash.com/photo-1611143669185-af224c5e3252?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80'
];

class _HomeScreenState extends State<HomeScreen> {
  List<Map> dataTable = [];

  void _navigateAndDisplayOrderScreen(BuildContext context) async {
    dynamic result = await Navigator.pushNamed(context, OrderScreen.routeName);
    setState(() {
      dataTable.add(result);
      print("test $result");
    });
  }

  final List<Widget> imageSliders = imgList
      // ignore: avoid_unnecessary_containers
      .map((item) => Container(
            margin: const EdgeInsets.all(13.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(item, fit: BoxFit.cover, width: 1000.0)),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        leading: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.red),
            )),
        backgroundColor: HexColor('#405FCF'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('./assets/images/Alvin_Image.jpg'),
            ),
          )
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true, height: 250, pauseAutoPlayOnTouch: true),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  _navigateAndDisplayOrderScreen(context);
                },
                child: const Text('Order Food'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(HexColor("#405FCF")),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    'Activity',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: HexColor('#405FCF'),
                ),
                width: MediaQuery.of(context).size.height * 0.9,
                height: MediaQuery.of(context).size.width * 0.55,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  summary(context, dataTable[index]["price"]));
                        },
                        leading: SizedBox(
                          child: Image(
                              image: NetworkImage(dataTable[index]["image"])),
                        ),
                        title: Text(dataTable[index]["title"]),
                        subtitle: Text(dataTable[index]["subtitle"]),
                        trailing: Text(dataTable[index]["price"].toString()),
                      ),
                    );
                  },
                  itemCount: dataTable.length,
                ))
          ],
        ),
      ),
    );
  }
}
