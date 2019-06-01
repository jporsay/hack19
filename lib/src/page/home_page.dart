import 'package:flutter/material.dart';
import 'package:hack19/src/occasion/widgets/occasion_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
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
          )
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
