import 'package:flutter/material.dart';
import 'package:loginagain/view/utils/colours.dart';
import 'package:provider/provider.dart';

import 'package:loginagain/view/utils/locator.dart';
import 'package:loginagain/view/utils/router.dart';

import 'model/user/user_model.dart';
import 'package:loginagain/state/currentUser_state.dart';



void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<CurrentUserState>().userController.stream,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colours.mainGreen,
          accentColor: Colours.mainGreen,
        ),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
