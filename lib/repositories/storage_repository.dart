import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

class StorageRepository {
  StorageRepository({
    required this.name,
  });

  final String name;
  final storage = FirebaseStorage.instance;

  final reference = FirebaseStorage.instance.ref();

  Future upload(File image) async {
    final fileName = basename(image.path);

    try {
      final ref = storage.ref(name).child(fileName);
      await ref.putFile(image);
    } catch (e) {
      debugPrint('Ops, erro de upload');
    }
  }

  Future<String?> download(String fileName) async {
    try {
      final path = "$name/$fileName";

      final imageUrl = await reference.child(path).getDownloadURL();
      return imageUrl;
    } catch (e) {
      debugPrint('Ops, erro de download.');
      return null;
    }
  }
}
