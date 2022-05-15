import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_an_library/main/MainHome.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WelcomeWidget();
  }
}

class WelcomeWidget extends State<Welcome> {
  int changeIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 50), (sd) {
      setState(() {
        changeIndex += 1;
      });
      if (changeIndex >= 100) {
        openMain();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/welcome.png",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            margin: const EdgeInsets.all(25),
            alignment: Alignment.center,
            child: GestureDetector(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      value: changeIndex / 100,
                      strokeWidth: 1,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text("跳过"),
                  )
                ],
              ),
              onTap: () {
                openMain();
              },
            ),
          ),
        )
      ],
    ));
  }

  void openMain() {
    timer.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainHome()),
        (route) => false);
  }
}
