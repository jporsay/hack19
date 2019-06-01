import 'package:flutter/material.dart';
import 'package:hack19/src/authentication/authentication_repository.dart';
import 'package:hack19/src/occasion/occasion.dart';
import 'package:hack19/src/page/login_page.dart';
import 'package:provider/provider.dart';

import '../occasion_model.dart';

class OccasionWidget extends StatelessWidget {
  final Occasion occasion;

  const OccasionWidget({Key key, @required this.occasion}) : super(key: key);

  _onJoinEvent(BuildContext context) async {
    final auth = Provider.of<AuthenticationRepository>(context);
    final occasionRepo = Provider.of<OccasionRepository>(context);
    var loggedIn = await auth.isLoggedIn().first;
    if (!loggedIn) {
      loggedIn = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginPage(),
        settings: RouteSettings(name: "Login"),
      ));
    }
    if (!loggedIn) {
      // TODO: Show error message
      return;
    }
    await occasionRepo.registerUser(occasion, await auth.loggedUser().first);
    // TODO: Show success message
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              Text(
                "${occasion.occasionDate.day}/${occasion.occasionDate.month}/${occasion.occasionDate.year}",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 15),),
              Text("Hosted by ${occasion.creator.username}", style: TextStyle(fontSize: 18),),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Want to attend? "),
                  Text(
                    "${occasion.getSpotsLeft()} spots left.",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Container(
                child: RaisedButton(
                  child: Text("Join event"),
                  onPressed: () => _onJoinEvent(context),
                ),
              )
            ],
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Event details",
                style: TextStyle(fontSize: 25),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    occasion.description,
                    style: TextStyle(color: Colors.black54),
                  ))
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
    occasion.requirements.forEach(
        (requirement) => requirements.add(RequirementWidget(requirement)));
    return requirements;
  }
}

class RequirementWidget extends StatelessWidget {
  final OccasionRequirement requirement;

  RequirementWidget(this.requirement);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              requirement.title,
              style: TextStyle(fontSize: 20),
            ),
            requirement.confirmedFulfiller != null
                ? Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          requirement.description,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Made possible thanks to: ${requirement.confirmedFulfiller.username}",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  )
                : Text("")
          ],
        ),
      ],
    );
  }
}
