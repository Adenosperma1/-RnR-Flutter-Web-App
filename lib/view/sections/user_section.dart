//this will show in the home page 'body' section

//can be alist view of all users or found users
//click on a user in the list to show their form view

//TODO you get over flow when you shrink the screen down

import 'package:flutter/material.dart';
import 'package:loginagain/model/user/user_model.dart';
//import 'package:loginagain/state/currentUser_state.dart';
import 'package:loginagain/state/user_state.dart';
import 'package:loginagain/view/utils/formField.dart';
//import 'package:loginagain/view/utils/locator.dart';
import 'package:loginagain/view/utils/responsive.dart';
import 'package:provider/provider.dart';

class UserSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: UserSectionlayout());
  }
}

class UserSectionlayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ResponsiveWidget(
          smallScreen: AnyScreen(),
          mediumScreen: AnyScreen(),
          largeScreen: AnyScreen(),
        )
      ],
    );
  }
}

class AnyScreen extends StatelessWidget {
  final TextEditingController id = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    id.text = user.id.toString();
    name.text = user.name;
    username.text = user.username;

//TODO the
//make my own sql table for user with the same details

    return ChangeNotifierProvider(
      create: (_) => UserState(),
      child: Center(
        child: Container(
          height: 500,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyFormField(
                  controller: id,
                  labelText: 'id',
                  obscureText: false,
                ),
                SizedBox(height: 20),
                //show all the user details
                MyFormField(
                  controller: name,
                  labelText: 'name',
                  obscureText: false,
                ),
                SizedBox(height: 20),
                MyFormField(
                  controller: username,
                  labelText: 'username',
                  obscureText: false,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
