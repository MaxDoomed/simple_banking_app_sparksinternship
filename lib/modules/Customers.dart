import 'package:banking_app/shared/sharedComponents.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';
import 'info.dart';

class Customers extends StatefulWidget {
  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  late int id2;
  late double z;
  var CustomerController = TextEditingController();
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[200],
        key: ScaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          leading: Icon(
            Icons.person,
          ),
          title: Text('Piggies'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  controller: CustomerController,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (String value) {
                    setState(() {
                      print(value);
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.pink[100],
                    hintText: 'Search Piggiezzz',
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(),
                  )),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ItemBuilder(context, list, index),
                  separatorBuilder: (context, index) => SizedBox(height: 0.0),
                  itemCount: 10),
            ],
          ),
        ));
  }

  Widget ItemBuilder(context, List l, int index) => Padding(
        padding: const EdgeInsets.all(7.5),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  id2 = index;
                  navigateTo(context, information(id2, index, list));
                  print(l[id2]['coin']);
                  print(id2);
                  z = l[index]['coin'];
                });
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      list[index]['name'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 254, 255, 255)),
                    ),
                    Spacer(),
                    Text(list[index]['coin'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 254, 255, 255))),
                  ]),
                ),
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 177, 82),
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      );
}
