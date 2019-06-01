import 'package:flutter/material.dart';
import 'package:hack19/src/occasion/occasion_model.dart';
import 'package:hack19/src/occasion/occasion_repository.dart';
import 'package:hack19/src/page/occasion_details_page.dart';
import 'package:provider/provider.dart';

class _SnapshotError extends StatelessWidget {
  final AsyncSnapshot<List<Occasion>> snapshot;

  const _SnapshotError({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Error loading events"),
      ),
    );
  }
}

class _OccasionListItem extends StatelessWidget {
  final Occasion occasion;
  const _OccasionListItem({
    Key key,
    @required this.occasion,
  }) : super(key: key);

  _navigateToDetails(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OccasionDetailPage(occasion: occasion),
      settings: RouteSettings(name: "Details: ${occasion.title}"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white70,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => _navigateToDetails(context),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    occasion.iconPhoto,
                    width: 50,
                    height: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(occasion.title, textScaleFactor: 1.5),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Organizer: " + occasion.creator.name, style: TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Event date: " + occasion.getFormattedEventDate()),
                    ),
                    Container(
                        padding: const EdgeInsets.all(4.0),
                        width: 300,
                        child: Text(occasion.getTrimmedDescription(64))
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("No available events"),
      ),
    );
  }
}

class OccasionList extends StatelessWidget {

  const OccasionList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OccasionRepository>(context);
    return StreamBuilder<List<Occasion>>(
      stream: provider.listConsolidated(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _SnapshotError();
        }
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return _EmptyView();
        }
        final data = snapshot.data;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, idx) => _OccasionListItem(occasion: data[idx])
        );
      },
    );
  }
}
