import 'package:planor/models/selectable.dart';

class StudyType extends Selectable {
  final int? id;
  final String? title;

  StudyType({this.id, this.title});

  static const revision = 0;
  static const firstContact = 1;

  @override
  bool get enabled => true;

  @override
  String get text => title ?? 'Nao encontrado';
}

final studyTypes = [
  StudyType(id: StudyType.revision, title: 'Revisao'),
  StudyType(id: StudyType.firstContact, title: 'Primeiro Contato'),
];
