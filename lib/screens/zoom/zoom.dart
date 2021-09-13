import 'package:exam/home/home.dart';
import 'package:exam/screens/zoom/zoomDrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'dart:ui' as ui;

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  ZoomDrawerController _controller = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
      controller: _controller,
      menuScreen: ZoomDrawerPage(),
      mainScreen: Home(_controller,),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      backgroundColor: Colors.grey[300]!,
      slideWidth: MediaQuery.of(context).size.width*(isRTL()? .45: 0.65),
    ),
    );
  }

  static List<String> RTL_LANGUAGES = ["ar", "ur", "he", "dv", "fa"];


  static bool isRTL() {
    final locale = _getLanguageCode();
    return RTL_LANGUAGES.contains(locale);
  }

  static String? _getLanguageCode() {
    try {
      return ui.window.locale.languageCode.toLowerCase();
    } catch (e) {
      return null;
    }
  }
}
