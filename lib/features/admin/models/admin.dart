import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/user.dart';

class Admin extends User {
  final bool create;
  final bool read;
  final bool update;
  final bool delete;
  final bool isActive;

  Admin({
    this.create = true,
    this.read = true,
    this.update = true,
    this.delete = true,
    this.isActive = true,
    required name,
    required lastName,
    required birthday,
    required gender,
    required country,
    required city,
    required state,
  }) : super(
          name: name,
          lastName: lastName,
          birthday: birthday,
          gender: gender,
          country: country,
          city: city,
          state: state,
        );

  @override
  bool get isAdmin => true;

  Admin.fromMap(DocumentSnapshot document)
      : create = document['create'] as bool,
        read = document['read'] as bool,
        update = document['update'] as bool,
        delete = document['delete'] as bool,
        isActive = document['isActive'],
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'create': create,
        'read': read,
        'update': update,
        'delete': delete,
        'isActive': isActive,
      });
  }
}
