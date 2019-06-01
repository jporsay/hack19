import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Occasion extends Equatable {
  final String id;
  final String name;

  Occasion(this.id, this.name);

  factory Occasion.fromSnapshotDocument(DocumentSnapshot document) {
    return Occasion(document.documentID, "");
  }
}
