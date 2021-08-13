import 'package:flutter/material.dart';
import 'package:intro_rocket/app.dart';
import 'package:intro_rocket/views/screens/planejar.dart';
import 'package:intro_rocket/views/screens/manobras.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MyHomePage(
                  title: 'IntroRocket',
                ));
      case '/planejar':
        return MaterialPageRoute(
          builder: (_) => PlanejarView(),
        );
      case '/planejar/manobras':
        return MaterialPageRoute(
          builder: (_) => ManobrasView(),
        );
      // case '/planejar/manobras/manobra':
      //   return MaterialPageRoute(builder: (_) => );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
