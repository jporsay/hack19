import 'package:flutter/material.dart';
import 'package:hack19/src/authentication/authentication_provider.dart';
import 'package:provider/provider.dart';

class _Title extends StatelessWidget {
  const _Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Text(
        "Fleetup",
        style: TextStyle(
          inherit: true,
          color: Colors.white70,
          fontSize: 32,
          fontFamily: textTheme.headline.fontFamily,
        ),
      ),
    );
  }
}

class _LoginMessage extends StatelessWidget {
  final String message;
  const _LoginMessage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Container(
        width: 150,
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white70,
            fontFamily: textTheme.headline.fontFamily,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final String message;

  const LoginPage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF6750d5),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _Title(),
                  if (message != null)
                    _LoginMessage(
                      message: message,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 128),
                    child: RaisedButton(
                      onPressed: () => authProvider.googleSignIn(),
                      child: Text("Login with Google"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
