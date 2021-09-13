import 'package:exam/register/login.dart';
import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
          ),
          Positioned(
            top: 28.0,
            left: 20.0,
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset("assets/main/image3.png"),
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 100.0,
            child: Text(
              "CALEB G",
              style: TextStyle(
                fontSize: 47.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 190.0,
            child: Text(
              "Restaurant",
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 80.0,
            left: 175.0,
            child: Image.asset(
              "assets/main/image1.png",
              height: 280.0,
            ),
          ),
          Positioned(
            bottom: 60,
            right: 90.0,
            child: Image.asset(
              "assets/main/image0.png",
              height: 380.0,
              width: 280.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.red, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: [0, 0.2, 0.6]),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 15.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                    (route) => false),
                child: Text("Get started"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    primary: Colors.white,
                    onPrimary: Colors.red,
                    fixedSize: Size(MediaQuery.of(context).size.width, 65.0)),
              ),
            ),
          )
        ],
      ),
    );
  }

  
}
