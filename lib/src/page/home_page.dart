import 'package:flutter/material.dart';
import 'package:hack19/src/authentication/authentication_repository.dart';
import 'package:hack19/src/occasion/widgets/occasion_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _SignOutButton extends StatelessWidget {
  const _SignOutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationRepository>(context);
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () async {
        auth.signOut();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Signed out"),
          duration: Duration(seconds: 1),
        ));
      },
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events near you"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateEventPage(),
                settings: RouteSettings(name: "Create event"),
              ));
            },
          ),
          _SignOutButton()
        ],
      ),
      backgroundColor: Color(0xFFd3d3d3),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
        child: OccasionList(),
      ),
    );
  }
}

class CreateEventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateEventPageState();
  }
}

class CreateEventPageState extends State<CreateEventPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create event")
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('Please enter the title'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            ),
            RaisedButton(
              child : Text('Guardar'),
              onPressed: () {
                Navigator.pop(context);
              }
            )
          ],
        )
      ),
    );
  }
}
