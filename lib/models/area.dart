import 'package:planor/models/selectable.dart';

class Area extends Selectable {
  final int? id;
  final String? title;

  Area({this.id, this.title});

  static const areaZero = 0;
  static const areaOne = 1;

  @override
  bool get enabled => true;

  @override
  String get text => title ?? 'Nao encontrado';
}

final areas = [
  Area(id: Area.areaZero, title: 'Area 1'),
  Area(id: Area.areaOne, title: 'Area Zero'),
];
