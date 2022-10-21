import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String nextRegister = '/nextRegister';
  static const String forgetPassword = '/forgetPassword';
  static const String homeScreen = '/home';
  static const String myCars = '/myCars';
  static const String myCarsDetails = '/myCarsDetails';
  static const String addNewCar = '/addNewCar';
  static const String mySchedule = '/mySchedule';
  static const String contact = '/contact';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
      // return MaterialPageRoute(
      //   builder: (context) => SplashScreen(),
      // );

      default:
        undefinedRoute;
    }
    return null;
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text('No Route')),
      ),
    );
  }
}
