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
      body: OccasionList(),
    );
  }
}
