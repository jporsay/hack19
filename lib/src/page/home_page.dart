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
