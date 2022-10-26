import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/database.dart';

class User extends DataBase {
  final String name;
  final String lastName;
  final DateTime birthday;
  final String gender;
  final String country;
  final String city;
  final String state;

  User({
    required this.name,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.country,
    required this.city,
    required this.state,
  });

  User.fromMap(DocumentSnapshot document)
      : name = document['name'] as String,
        lastName = document['lastName'] as String,
        birthday = (document['birthday'] as Timestamp).toDate(),
        gender = document['gender'],
        country = document['country'],
        city = document['city'],
        state = document['state'],
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'name': name,
        'lastName': lastName,
        'birthday': birthday,
        'gender': gender,
        'country': country,
        'city': city,
        'state': state,
      });
  }

  bool isAdmin = false;
}
