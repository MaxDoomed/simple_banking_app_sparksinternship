import 'package:banking_app/shared/constants.dart';
import 'package:flutter/material.dart';

class transtable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          leading: Icon(Icons.compare_arrows),
          title: Text('Transfer Table'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 244, 177, 82),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                trans['Sender'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.trending_flat_outlined),
                              Text(
                                trans['Receiver'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                trans['coin'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(height: 0.0),
            itemCount: 1));
  }
}
