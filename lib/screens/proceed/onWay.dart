import 'package:flutter/material.dart';

class OnWay extends StatefulWidget {
  const OnWay({Key? key}) : super(key: key);

  @override
  _OnWayState createState() => _OnWayState();
}

class _OnWayState extends State<OnWay> {
  @override
  Widget build(BuildContext context) {
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
                  // Image.asset(
                  //   "assets/home/time.gif",
                  // ),
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
}
