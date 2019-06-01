import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  String name;
  String username;
  String phone;
  Address address;

  User(this.id, this.email);

  factory User.fromSnapshotDocument(DocumentSnapshot document) {
    return User(document.documentID, document.data["email"]);
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

  factory UserReference.from(User user) {
    return UserReference(user.id, user.name, user.username, user.email);
  }

  factory UserReference.fromDynamic(dynamic data) {
    return UserReference(
      data["userId"], data["name"], data["username"], data["email"],
    );
  }
}