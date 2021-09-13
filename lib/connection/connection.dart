import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Connection extends StatefulWidget {
  const Connection({Key? key}) : super(key: key);

  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/home/internet.png",
                          height: 120.0,
                          width: 120.0,
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "No internet Connection",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "Your internet connection is currently",
                          style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          "not available please check or try again.",
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
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await Future.delayed(Duration(milliseconds: 600));

                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Text("Try again"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width, 60.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                  ),
                )
              ],
            )
          : Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
