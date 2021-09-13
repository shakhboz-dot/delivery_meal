import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/screens/proceed/onWayTime.dart';
import 'package:exam/screens/zoom/zoom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _PaymentState extends State<Payment> {
  String pay = "Card";
  String del = "Door";

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment",
                  style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Method",
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
                              title: Row(
                                children: [
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF47B0A),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Icon(
                                      Icons.payment,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "Card",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  )
                                ],
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
                              value: "Mobile",
                              groupValue: pay,
                              onChanged: (String? sel) {
                                setState(() {
                                  pay = sel!;
                                });
                              },
                              title: Row(
                                children: [
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFEB4796),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                        child: Icon(
                                      Icons.account_balance,
                                      color: Colors.white,
                                      size: 20.0,
                                    )),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "Mobile Money (MTN,VODA)",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                          value: "Door",
                          groupValue: del,
                          onChanged: (String? sel) {
                            setState(() {
                              del = sel!;
                            });
                          },
                          title: Text(
                            "Door Payment",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 70.0, right: 20.0),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        RadioListTile(
                          activeColor: Colors.red,
                          value: "Pick up",
                          groupValue: del,
                          onChanged: (String? sel) {
                            setState(() {
                              del = sel!;
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
              padding: const EdgeInsets.only(top: 20.0, left: 3.0, right: 3.0),
              child: ElevatedButton(
                onPressed: () {
                  _showMaterialDialog(context);
                },
                child: Text("Proceed to payment"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: Size(MediaQuery.of(context).size.width, 60.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.only(left: 30.0, right: 15.0, top: 20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "Please note",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            children: [
              Text(
                "Delivery to Trasaco",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
              Text(
                "GHS 2 - GH 3",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12.0),
              Divider(color: Colors.black),
              SizedBox(height: 12.0),
              Text(
                "Delivery to Campus",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
              Text(
                "GHS 1",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnWayTime()),
                        (route) => false),
                    child: Text(
                      "Proceed",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      primary: Colors.red,
                      fixedSize: Size(150.0, 60.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          );
        });
  }
}
