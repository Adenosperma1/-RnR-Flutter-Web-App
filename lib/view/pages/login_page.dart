import 'package:flutter/material.dart';
import 'package:loginagain/view/utils/formField.dart';
import 'package:provider/provider.dart';
import 'package:loginagain/view/utils/all_shared.dart';

//States
import 'package:loginagain/state/login_state.dart';
//TODO custome field class for use everywhere
//TODO forgot password
//TODO need a time out for failed log in?

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Loginlayout());
  }
}

class Loginlayout extends StatelessWidget {

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
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginState(),
      child: Center(
        child: Container(
          height: 500,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormTitle(),
                FormError(),
                MyFormField(
                  controller: email,
                  labelText: 'email',
                  obscureText: false,
                ),
                SizedBox(height: 10.0),
                MyFormField(
                  controller: password,
                  labelText: 'password',
                  obscureText: true,
                ),
                ForgotButton(emailController: email),
                SizedBox(height: 48.0),
                FormButton(
                    emailController: email,
                    passwordController: password),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Log in",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context, listen: false);

    return Consumer<LoginState>(
      builder: (_, counter, __) => Column(
        children: <Widget>[
          loginState.errorMessage != null
              ? Container(
                  height: 50,
                  child: Center(
                      child: Text(loginState.errorMessage,
                          style: TextStyle(color: Colors.red))))
              : Container(height: 50)
        ],
      ),
    );
  }
}


class FormButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  FormButton(
      {@required this.emailController, @required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context, listen: false);

    return Consumer<LoginState>(
      builder: (_, counter, __) => Container(
        child: loginState.state == ViewState.Busy
            ? Container(height: 40, child: spinner())
            : Container(
                height: 40,
                width: double.infinity,
                child: RaisedButton(
                  color: Colours.mainGreen,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    var loginSuccess = await loginState.login(
                        email: emailController.text,
                        password: passwordController.text);
                    if (loginSuccess) {
                      Navigator.pushNamed(context, '/');
                    }
                  },
                ),
              ),
      ),
    );
  }
}

class ForgotButton extends StatelessWidget {
  final TextEditingController emailController;

  ForgotButton({@required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (_, counter, __) => Container(
        child: Container(
          height: 40,
          width: double.infinity,
          child: FlatButton(
            child: Text(
              'Forgot Password!',
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () async {
              // go to a new screen?
              //var loginSuccess = await loginState.login(
              //    email: emailController.text,);
              // if (loginSuccess) {
              //  Navigator.pushNamed(context, '/');
              // }
            },
          ),
        ),
      ),
    );
  }
}
