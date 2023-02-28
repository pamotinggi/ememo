import 'dart:async';

import 'package:flutter/material.dart';

import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3),
        ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Splash Screen"
      ),
    );
  }
}
