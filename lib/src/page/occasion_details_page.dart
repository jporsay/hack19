import 'package:flutter/material.dart';
import 'package:hack19/src/occasion/occasion.dart';
import 'package:hack19/src/occasion/widgets/occasion_widget.dart';

class OccasionDetailPage extends StatelessWidget {
  final Occasion occasion;
  const OccasionDetailPage({Key key, this.occasion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(occasion.title)),
      body: Center(
        child: SafeArea(
          // TODO(jime): Fix this
          child: OccasionWidget(
            occasion: occasion,
          ),
        ),
      ),
    );
  }
}
