import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/screens/proceed/payment.dart';
import 'package:exam/screens/zoom/zoom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _DeliveryState extends State<Delivery> {
  var datas;

  String pay = "Card";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    takeData().then((value) {
      setState(() {
        datas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return datas != null
        ? Scaffold(
            appBar: AppBar(
              toolbarHeight: 65.0,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Zoom()),
                    (route) => false),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 17.0,
                ),
              ),
              title: Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(
                          fontSize: 34.0, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address details",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          "change",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(color: Colors.black12),
                                    )),
                                    child: Text(
                                      "Thelma Sara-bear",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 25.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(color: Colors.black12),
                                    )),
                                    child: Text(
                                      "Trasaco hotel,behind navrongo campus",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    datas['phone'],
                                    style: GoogleFonts.actor(
                                      fontSize: 12.0,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Method",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            RadioListTile(
                              activeColor: Colors.red,
                              value: "Card",
                              groupValue: pay,
                              onChanged: (String? sel) {
                                setState(() {
                                  pay = sel!;
                                });
                              },
                              title: Text(
                                "Door delivery",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 70.0, right: 20.0),
                              child: Divider(
                                thickness: 0.5,
                              ),
                            ),
                            RadioListTile(
                              activeColor: Colors.red,
                              value: "Pick up",
                              groupValue: pay,
                              onChanged: (String? sel) {
                                setState(() {
                                  pay = sel!;
                                });
                              },
                              title: Text(
                                "Pick up",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 28.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text(
                          "23,000",
                          style: GoogleFonts.actor(fontSize: 18.0),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 28.0, left: 3.0, right: 3.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Payment()));
                    },
                    child: Text("Proceed to payment"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width, 60.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                  ),
                )
              ]),
            ),
          )
        : Scaffold(
          body: Center(
              child: CupertinoActivityIndicator(),
            ),
        );
  }
}

Future takeData() async {
  DocumentSnapshot _documentSnap =
      await _firestore.doc("User/${_auth.currentUser!.uid}").get();
  return _documentSnap;
}
