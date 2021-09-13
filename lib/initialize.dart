import 'package:exam/connection/connection.dart';
import 'package:exam/mainPage/mainPage.dart';
import 'package:exam/screens/zoom/zoom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Initialize extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitializeState();
  }
}

class InitializeState extends State<Initialize> {
  FirebaseAuth? _auth;
  User? _user;

  bool? isLoading;

  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    _auth = FirebaseAuth.instance;
    _user = _auth!.currentUser;
    isLoading = false;
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading!
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? _connectionStatus == "ConnectivityResult.wifi" || _connectionStatus == "ConnectivityResult.mobile"
                ? MainPage()
                : Connection()
            : _connectionStatus == "ConnectivityResult.wifi" || _connectionStatus == "ConnectivityResult.mobile"
                ? Zoom()
                : Connection();
  }
}
