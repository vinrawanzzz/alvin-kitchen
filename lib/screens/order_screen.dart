import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);
  static const routeName = 'order-screen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Map> dataMakanan = [
    {
      'title': "Carbonara",
      'subtitle': "On Progress",
      'price': 30000,
      'image':
          "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1521966079/fllrfweac2dhzdyigi62.jpg"
    },
    {
      'title': "Aglio e olio",
      'subtitle': "On Progress",
      'price': 35000,
      'image':
          "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1521966079/ean46kozkf4putfijcah.jpg"
    },
    {
      'title': "Bolognese",
      'subtitle': "On Progress",
      'price': 38000,
      'image':
          "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1521966080/vm3sskwnoxawtavoazu5.jpg"
    },
    {
      'title': "Pesto",
      'subtitle': "On Progress",
      'price': 32000,
      'image':
          "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1521966079/ndghqewabzezfogs6lc7.jpg"
    },
    {
      'title': "Alfredo",
      'subtitle': "On Progress",
      'price': 40000,
      'image':
          "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1521966078/fivdre8azlnzi7ubcak0.jpg"
    },
  ];
  String search = "";
  TextEditingController searchbar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#405FCF'),
        title: const Text('Order Food'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 3.5 / 4,
                height: MediaQuery.of(context).size.height * 1 / 8,
                child: TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (val) {
                    setState(() {
                      search = val;
                    });
                  },
                  controller: searchbar,
                  decoration: InputDecoration(
                    hintText: 'Type name here...',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search_sharp),
                      onPressed: () {
                        setState(() {
                          search = searchbar.text;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(55))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 6 / 8,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return search == "null"
                      ? Card(
                          child: ListTile(
                            leading: Image(
                                image:
                                    NetworkImage(dataMakanan[index]['image'])),
                            title: Text(dataMakanan[index]['title']),
                            subtitle:
                                Text(dataMakanan[index]['price'].toString()),
                            trailing: TextButton(
                                onPressed: () {
                                  Navigator.pop(context, dataMakanan[index]);
                                  // print(dataMakanan[index]);
                                },
                                child: const Text('Order')),
                          ),
                        )
                      : dataMakanan[index]['title']
                              .toUpperCase()
                              .contains(search.toUpperCase())
                          ? Card(
                              child: ListTile(
                                leading: Image(
                                    image: NetworkImage(
                                        dataMakanan[index]['image'])),
                                title: Text(dataMakanan[index]['title']),
                                subtitle: Text(
                                    dataMakanan[index]['price'].toString()),
                                trailing: TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context, dataMakanan[index]);
                                      // print(dataMakanan[index]);
                                    },
                                    child: const Text('Order')),
                              ),
                            )
                          : Container();
                },
                itemCount: dataMakanan.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
