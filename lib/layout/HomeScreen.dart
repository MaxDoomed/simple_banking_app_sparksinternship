import 'package:banking_app/modules/Customers.dart';
import 'package:banking_app/modules/TransTable.dart';
import 'package:banking_app/shared/sharedComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.pink[200],
          body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Piggy Bank System',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                      Image(
                        image: AssetImage('assets/images/piggy.png'),
                        height: 220,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              navigateTo(context, Customers());
                              insertonDB();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 244, 177, 82),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Center(
                            child: Text(
                              'Our Piggies',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            navigateTo(context, transtable());
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 244, 177, 82),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Center(
                            child: Text(
                              'All Coins',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
      ),
    );
  }
}
