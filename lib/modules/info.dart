import 'package:banking_app/modules/transfer.dart';
import 'package:banking_app/shared/constants.dart';
import 'package:banking_app/shared/sharedComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class information extends StatefulWidget {
  int id2;
  List<Map> user = [];
  int index;
  information(@required this.id2, @required this.index, @required this.user);

  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  late String val;
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var FormdKey = GlobalKey<FormState>();

  var transController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormdKey,
      child: Scaffold(
          backgroundColor: Colors.pink[200],
          key: ScaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.pink[300],
            title: Text(
              ''
              'User Details',
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 160,
                          color: Colors.pink[300],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              list[widget.index]['name'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Mobile number : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              list[widget.index]['phone'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Balance Coins : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              list[widget.index]['coin'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Email : ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              list[widget.index]['email'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'ID : ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              list[widget.index]['id'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink[200],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 244, 177, 82)),
                      onPressed: () {
                        setState(() {});
                        if (FormdKey.currentState!.validate()) {
                          print(transController.text);
                        }
                        ScaffoldKey.currentState?.showBottomSheet((context) =>
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: transController,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (value) {
                                      setState(() {});
                                      if (FormdKey.currentState!.validate()) {
                                        print(transController.text);
                                        if (int.parse(transController.text) <
                                            widget.user[widget.index]['coin']) {
                                          print('okkkk');
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Choose Customer You want to transfer to",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 4,
                                              backgroundColor: Colors.pink,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          // double Rs=user[index]['Rs']-double.parse(transController.text);
                                          navigateTo(
                                              context,
                                              transferTO(
                                                  coin: int.parse(
                                                      transController.text),
                                                  id1: widget.index));
                                          //UpdateDB(Rs, index);
                                          // navigateToAndTrans(context, Customers(), id2, double.parse(transController.text), user);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "You Don't have enough Coins",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 4,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      }
                                      //print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "You can't transfer null";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 15),
                                      labelText: 'Enter Coins',
                                      suffixIcon:
                                          Icon(Icons.compare_arrows_sharp),
                                      border: OutlineInputBorder(),
                                    )),
                              ),
                            ));
                      },
                      child: Text(
                        'Transfer Coins',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
