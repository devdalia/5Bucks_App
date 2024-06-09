import 'dart:async';
import 'package:bucks_app/ui/Screen/home_application.dart';
import 'package:bucks_app/ui/Screen/login_screen.dart';
import 'package:bucks_app/utilities/const.dart';
import 'package:bucks_app/utilities/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController ?animationController;
  String? token;


  @override
  void initState() {
    super.initState();
    getPrefValues();
    goToIntroSlider();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );

    animationController!.repeat();
  }

  stopRotation() {
    animationController!.stop();
  }

  startRotation() {
    animationController!.repeat();
  }

  @override
  void dispose() {
    stopRotation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Container(
              height: 70.0.h,
              width: 100.0.w,
              child: Image.asset("assets/images/lo.png")),
            Container(
              child: AnimatedBuilder(
                  animation: animationController!,
                  builder: (context, child) {
                    return Transform.rotate(
                        angle: animationController!.value * 6.3,
                        child: Image.asset('assets/images/image_loading.png',color: kPrimaryColor,
                            width: 50, height: 50));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  goToIntroSlider() {
    Timer(Duration(seconds: 5), navigationPage);
  }

  void navigationPage() {
    if (token != '') {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeApplication.id, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.id, (route) => false);
    }
  }

  getPrefValues() async {
    String tokenPref = await getPrefString(token_pref);
    setState(() {
      token = tokenPref;
    });
  }
}
