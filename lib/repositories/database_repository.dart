import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:planor/core/extensions.dart';
import 'package:planor/features/auth/pages/landing/landing_controller.dart';
import 'package:planor/models/database.dart';
import 'package:planor/repositories/storage_repository.dart';
import 'package:rxdart/subjects.dart';

abstract class DataBaseRepository<T extends DataBase> {
  DataBaseRepository({
    required this.fromMap,
    required this.name,
  });

  StorageRepository get storageRepository => StorageRepository(name: name);

  String get path => isAdmin ? name : 'users/$studentId/$name';

  final String name;
  final T Function(DocumentSnapshot document) fromMap;

  CollectionReference get collection =>
      FirebaseFirestore.instance.collection(path);

  Reference get storage => FirebaseStorage.instance.ref().child(path);

  Query<Map<String, dynamic>> get collectionGroup =>
      FirebaseFirestore.instance.collectionGroup(name.pathReference);

  final _streamController = BehaviorSubject<List<T>?>();

  List<T>? get result => _streamController.value;

  Stream<List<T>?> get stream => _streamController.stream;

  Future<void> save(T model, {String? documentId}) async {
    try {
      await collection.doc(documentId).set(model.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void update(String documentId, T model) =>
      collection.doc(documentId).update(model.toMap());

  void delete(String documentId) => collection.doc(documentId).delete();

  Stream<List<T>> get read {
    if (isAdmin) {
      return collectionGroup.snapshots().map((query) =>
          query.docs.map<T>((document) => fromMap(document)).toList());
    } else {
      return collection.snapshots().map((query) =>
          query.docs.map<T>((document) => fromMap(document)).toList());
    }
  }

  Future<T?> get(String documentId) async =>
      await collection.doc(documentId).get().then((doc) => fromMap(doc));

  Future upload(File image) async => await storageRepository.upload(image);

  Future<String?> download(String fileName) async =>
      storageRepository.download(fileName);
}
