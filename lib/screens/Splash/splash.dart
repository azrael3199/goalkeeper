import 'dart:async';

import 'package:flutter/material.dart';

///
/// Widget for displaying Splash screen
///

class SplashTransition extends StatefulWidget {
  const SplashTransition({super.key});

  @override
  State<SplashTransition> createState() => _SplashTransitionState();
}

class _SplashTransitionState extends State<SplashTransition> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/images/logo_main.png',
          height: MediaQuery.of(context).size.height),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
