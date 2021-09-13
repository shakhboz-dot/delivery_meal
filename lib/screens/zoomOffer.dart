import 'package:flutter/material.dart';

class ZoomOffer extends StatelessWidget {
  const ZoomOffer({Key? key}) : super(key: key);

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
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 17.0,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 180.0,top: 10.0),
              child: Text(
                "My offers",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 210.0),
            Text(
              "ohh snap!  No offers yet",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              " please check again.",
              style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
