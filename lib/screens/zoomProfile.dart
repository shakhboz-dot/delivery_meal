import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ZoomProfile extends StatefulWidget {
  ZoomProfile({Key? key}) : super(key: key);

  @override
  _ZoomProfileState createState() => _ZoomProfileState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _ZoomProfileState extends State<ZoomProfile> {
  String pay = "Card";

  List<String> _list = ["Order", "Pending reviews", "Faq", "Help"];

  var datas;

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
              toolbarHeight: 60.0,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 17.0,
                ),
              ),
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
                        "My profile",
                        style: TextStyle(
                            fontSize: 33.0, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Personal details",
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
                        height: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/home/profile2.png",
                                  height: 70.0,
                                  width: 60.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Thelma Sara-bear",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black12),
                                      )),
                                      child: Text(
                                        datas['email'],
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black12),
                                      )),
                                      child: Text(
                                        datas['phone'],
                                        style: GoogleFonts.actor(
                                          fontSize: 12.0,
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Trasaco hotel,behind navrongo\ncampus",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.black12,
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
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        tileColor: Colors.white,
                        title: Text(_list[0]),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        tileColor: Colors.white,
                        title: Text(_list[1]),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        tileColor: Colors.white,
                        title: Text(_list[2]),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        tileColor: Colors.white,
                        title: Text(_list[3]),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 3.0, right: 3.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Update"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 60.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
          body: Center(
              child: CupertinoActivityIndicator(),
            ),
        );
  }

  Future takeData() async {
    DocumentSnapshot _documentSnap =
        await _firestore.doc("User/${_auth.currentUser!.uid}").get();
    return _documentSnap;
  }
}
