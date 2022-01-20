import 'package:covinfo/pages/home.dart';
import 'package:covinfo/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/icons/splash1.json'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'COVINFO',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Typo Round',
                  color: kSecondry,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
