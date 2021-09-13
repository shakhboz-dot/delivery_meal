import 'dart:io';
import 'package:exam/initialize.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  _enablePlatformOverrideForDesktop();
  runApp(new App());
}

final Future<FirebaseApp> _initfirebase = Firebase.initializeApp();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: FutureBuilder(
        future: _initfirebase,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Initialize();
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Text("Error !!!"),
            );
          }
          return Scaffold(
            body: Platform.isAndroid
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: CupertinoActivityIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
