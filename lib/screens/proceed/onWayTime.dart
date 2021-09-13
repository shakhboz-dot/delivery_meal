import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/screens/proceed/orderComplete.dart';
import 'package:exam/screens/zoom/zoom.dart';
import 'package:flutter/material.dart';

class OnWayTime extends StatefulWidget {
  const OnWayTime({Key? key}) : super(key: key);

  @override
  _OnWayTimeState createState() => _OnWayTimeState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _OnWayTimeState extends State<OnWayTime> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    running();
  }

  @override
  Widget build(BuildContext context) {
    running();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150.0),
          Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/home/time.gif",
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Your order is running",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Please, Wait for some",
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                    ),
                  ),
                  Text(
                    "minutes",
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 40.0, right: 40.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Cancel"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  fixedSize: Size(MediaQuery.of(context).size.width, 60.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
            ),
          )
        ],
      ),
    );
  }

  running() async {
    var snapshot = await _firestore.collection('Deliver').get();

    for (var item in snapshot.docs) {
      
      await _firestore
          .collection('Deliver')
          .doc('${item.id}')
          .update({'state': true});
    }

    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contexr) => OrderComplete()));
  }
}
