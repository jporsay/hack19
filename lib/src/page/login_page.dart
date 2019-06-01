import 'package:flutter/material.dart';
import 'package:hack19/src/authentication/authentication_provider.dart';
import 'package:hack19/src/page/home_page.dart';
import 'package:provider/provider.dart';

const _whiteColor = Colors.white70;

class _Title extends StatelessWidget {
  const _Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 128),
      child: Text(
        "Fleetup",
        style: TextStyle(
          inherit: true,
          color: _whiteColor,
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
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        width: 150,
        child: Text(
          message,
          style: TextStyle(
            color: _whiteColor,
            fontFamily: textTheme.headline.fontFamily,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  final String message;

  const _ErrorMessage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.title;
    return Container(
      child: Text(
        message,
        style: TextStyle(
          color: Colors.red[600],
          fontSize: 16,
          fontFamily: theme.fontFamily,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  final String message;

  const LoginPage({Key key, this.message}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _error;

  _doGoogleLogin(BuildContext context) async {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final success = await authProvider.googleSignIn();
    if (!success) {
      setState(() {
        _error = "There was a problem while signing in";
      });
    }
    if (success) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
        settings: RouteSettings(name: "Home"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6750d5),
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                children: <Widget>[
                  if (Navigator.of(context).canPop())
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: _whiteColor,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                ],
              ),
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      _Title(),
                      if (widget.message != null)
                        _LoginMessage(
                          message: widget.message,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 128),
                        child: RaisedButton(
                          onPressed: () => _doGoogleLogin(context),
                          child: Text("Login with Google"),
                        ),
                      ),
                      if (_error != null)
                        _ErrorMessage(
                          message: _error,
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
