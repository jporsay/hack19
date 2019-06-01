import 'package:flutter/material.dart';

import '../occasion_model.dart';

class OccasionWidget extends StatelessWidget {
  final Occasion occasion;

  const OccasionWidget({Key key, @required this.occasion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(occasion.occasionDate);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(occasion.occasionDate.toString(), style: TextStyle(color: Colors.grey),),
          Text(occasion.title, style: TextStyle(fontSize: 30),),
          Row(
            children: <Widget>[
              Text("Hosted by ${occasion.creator.username}"),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Want to attend? "),
                  Text("${occasion.getSpotsLeft()} spots left.", style: TextStyle(color: Colors.grey),)
                ],
              ),
              Container(
                child: RaisedButton(
                  child: Text("Join event"),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Event details", style: TextStyle(fontSize: 25),),
              Text(occasion.description)
            ],
          ),
          Divider(),
          Column(
            children: buildRequirementsWidgets(),
          )
        ],
      ),
    );
  }

  buildRequirementsWidgets() {
    List<Widget> requirements = new List();
    occasion.requirements
      .forEach((requirement) => requirements.add(RequirementWidget(requirement)));
    return requirements;
  }
}

class RequirementWidget extends StatelessWidget {
  OccasionRequirement requirement;

  RequirementWidget(this.requirement);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(requirement.title, style: TextStyle(fontSize: 20),),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              Text("Made possible thanks to: ${requirement.confirmedFulfiller.username}")
            ],
          ),
        )
      ],
    );
  }
}