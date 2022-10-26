import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/database.dart';
import 'package:planor/models/image_blurhash.dart';
import 'package:planor/models/selectable.dart';

class Book extends DataBase with Selectable {
  final String title;
  final String? description;
  final int pages;
  final ImageBlurHash? image;
  final bool isConcluded;

  Book({
    required this.title,
    this.description,
    required this.pages,
    this.image,
    this.isConcluded = false,
  });

  Book.fromMap(DocumentSnapshot document)
      : title = document['title'] as String,
        description = document['description'] as String,
        pages = document['pages'] as int,
        image =
            ImageBlurHash.fromJson(document['image'] as Map<String, dynamic>),
        isConcluded = document['isConcluded'] as bool,
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'title': title,
        'description': description,
        'pages': pages,
        'image': image?.toJson(),
        'isConcluded': isConcluded,
      });
  }

  @override
  bool get enabled => true;

  @override
  String get text => title;
}
