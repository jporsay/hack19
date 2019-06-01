import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack19/src/occasion/occasion_model.dart';
import 'package:hack19/src/user/user_model.dart';

class OccasionRepository {
  final _collection = Firestore.instance.collection('occasions');

  Future<void> registerUser(Occasion occasion, LoggedInUser user) async {
    occasion.confirmedAssistants.add(UserReference.from(user));
    final attendants =
        occasion.confirmedAssistants.map((u) => u.userId).toList();
    await _collection.document(occasion.id).updateData({
      'confirmed': attendants,
    });
  }

  Stream<List<Occasion>> listConsolidated(
      {int limit = 20, DocumentSnapshot startAfter}) {
    var query = _collection;
    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }
    return query.limit(limit).snapshots().map(_mapSnapshotToOccasionList);
  }

  List<Occasion> _mapSnapshotToOccasionList(QuerySnapshot snapshot) {
    List<Occasion> list = snapshot.documents
        .map((document) => Occasion.fromSnapshotDocument(document))
        .toList();
    list.add(list.first);
    list.add(list.first);
    list.add(list.first);
    list.add(list.first);
    list.add(list.first);
    list.add(list.first);
    list.add(list.first);
    list.add(list.first);
    list.add(list.first);
    return list;
  }
}
