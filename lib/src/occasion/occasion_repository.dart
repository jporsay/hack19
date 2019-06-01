import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack19/src/occasion/occasion_model.dart';

class OccasionRepository {
  Stream<List<Occasion>> listConsolidated(
      {int limit = 20, DocumentSnapshot startAfter}) {
    var query = Firestore.instance.collection('occasions');
    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }
    return query.limit(limit).snapshots().map(_mapSnapshotToOccasionList);
  }

  List<Occasion> _mapSnapshotToOccasionList(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((document) => Occasion.fromSnapshotDocument(document))
        .toList();
  }
}
