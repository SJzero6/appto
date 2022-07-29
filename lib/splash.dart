import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:appto/home.dart';
import 'package:appto/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navigatetohome();
    super.initState();
  }

  _navigatetohome() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('./assets/animation/mail.json'),
      ),
    );
  }
}
