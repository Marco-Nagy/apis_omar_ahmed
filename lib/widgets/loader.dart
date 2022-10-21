import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/img/garas_logo.png",
            width: 25,
            height: 25,
          ),
          Image.asset(
            "assets/img/dots_loader.gif",
            width: 35,
            height: 35,
          ),
        ],
      ),
    );
  }
}

class SecondLoader extends StatelessWidget {
  const SecondLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/circle_loader_color.gif",
          ),
          Image.asset(
            "assets/img/garas_logo.png",
            width: 18,
            height: 18,
          ),
        ],
      ),
    );
  }
}

class ThirdLoader extends StatelessWidget {
  const ThirdLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: Image.asset(
          "assets/img/dots_loader.gif",
        ),
      ),
    );
  }
}
