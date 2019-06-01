import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hack19/src/user/user_model.dart';

enum OccasionStatus {
  /*
   * El usuario esta aun completando los datos necesarios
   */
  DRAFT,

  /*
   * Todos los datos estan confirmados y falta que otros usuarios se ofrezcan para cumplir los requerimientos
   */

  PENDING_FULFILLERS,

  /*
   * Todos los requerimientos estan confirmados.
   */

  PENDING_CONFIRMATION,

  /*
   * El creador del evento confirmo el evento y se notifico a todos los usuarios implicados
   */
  CONFIRMED,

  /*
   * El evento fue cancelado y se notifico a todos los usuarios implicados
   */
  CANCELED
}

class Occasion extends Equatable {
  final String id;
  UserReference creator;
  DateTime creationDate;
  String title;
  String description;
  List<Tag> tags;
  DateTime occasionDate;
  DateTime requirementsDate;
  int maxAssistantsCount;
  List<OccasionRequirement> requirements = [];
  List<UserReference> confirmedAssistants = [];
  List<UserReference> assistantsWaitingList = [];
  OccasionStatus status = OccasionStatus.DRAFT;

  Occasion(this.id, this.title);

  factory Occasion.fromSnapshotDocument(DocumentSnapshot document) {
    Occasion model = Occasion(
        document.documentID, document.data["title"]
    );
    return model;
  }
}

class OccasionRequirement {
  String text;
  List<UserReference> fulfillers = [];
  UserReference confirmedFulfiller;
}


class Tag {
  String id;
  String label;
}