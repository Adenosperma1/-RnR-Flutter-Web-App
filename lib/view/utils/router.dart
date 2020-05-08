import 'package:flutter/material.dart';
import 'package:loginagain/view/pages/home_page.dart';
import 'package:loginagain/view/pages/login_page.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      //case 'post':
      // var post = settings.arguments as Post;
      // return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
