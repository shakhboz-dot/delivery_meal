import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new,size: 17.0,),
        ),
        title: Text(
          "History",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
      ),
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
                    "assets/home/history.png",
                    height: 100.0,
                    width: 100.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "No history yet",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Hit the orange button down",
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                    ),
                  ),
                  Text(
                    "below to Create an order",
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
              child: Text("Start ordering"),
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
