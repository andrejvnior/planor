import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/features/auth/pages/landing/landing_controller.dart';

abstract class DataBase {
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  String? uuid;
  // String? userId;

  DataBase();

  DataBase.fromMap(DocumentSnapshot document)
      : createdAt = (document['createdAt'] as Timestamp).toDate(),
        updatedAt = (document['updatedAt'] as Timestamp).toDate(),
        uuid = document.id;

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt, // createdAt,
      'updatedAt': updatedAt, //updatedAt,
      'createdBy': studentId,
    };
  }
}
