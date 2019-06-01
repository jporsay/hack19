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
  String id;
  UserReference creator;
  DateTime creationDate;
  String title;
  String description;
  List<Tag> tags = [];
  DateTime occasionDate;
  DateTime requirementsDate;
  int maxAssistantsCount;
  List<OccasionRequirement> requirements = [];
  List<UserReference> confirmedAssistants = [];
  List<UserReference> assistantsWaitingList = [];
  OccasionStatus status = OccasionStatus.DRAFT;

  Occasion({
    this.id,
    this.creator,
    this.creationDate,
    this.title,
    this.description,
    this.occasionDate,
    this.requirementsDate,
    this.maxAssistantsCount,
    this.status
  });

  factory Occasion.fromSnapshotDocument(DocumentSnapshot document) {
    Occasion model = Occasion();
    model.id = document.documentID;
    model.title = document.data["title"];
    model.creator = UserReference(
        document.data["creator"]["userId"].toString(),
        document.data["creator"]["email"].toString(),
        document.data["creator"]["username"].toString()
    );
    model.description = document.data["description"];
    model.maxAssistantsCount = document.data["maxAssistantsCount"];
    model.status = document.data["status"];
    return model;
  }

  factory Occasion.draft(User user, String title) {
    Occasion model = Occasion();
    model.creator = UserReference.from(user);
    model.title = title;
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
