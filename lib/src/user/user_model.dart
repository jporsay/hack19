import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends Equatable {}

class AnonymousUser extends User {}

class LoggedInUser extends User {
  final String id;
  final String email;
  String name;
  String username;
  String phone;
  Address address;

  LoggedInUser(this.id, this.email);

  factory LoggedInUser.fromFirebaseUser(FirebaseUser user) {
    return LoggedInUser(user.uid, user.email);
  }
  factory LoggedInUser.fromSnapshotDocument(DocumentSnapshot document) {
    return LoggedInUser(document.documentID, document.data["email"]);
  }
}

class Address extends Equatable {
  String city;
  String street;
}

class UserReference {
  final String userId;
  final String username;
  final String email;
  final String name;

  UserReference(this.userId, this.name, this.username, this.email);

  factory UserReference.from(LoggedInUser user) {
    return UserReference(user.id, user.name, user.username, user.email);
  }

  factory UserReference.fromDynamic(dynamic data) {
    return UserReference(
      data["userId"], data["name"], data["username"], data["email"],
    );
  }
}


