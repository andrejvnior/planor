import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planor/features/activity/models/activity.dart';
import 'package:planor/features/activity/pages/edit/activity_edit_controller.dart';
import 'package:planor/features/book/models/book.dart';
import 'package:planor/models/area.dart';
import 'package:planor/models/study_type.dart';
import 'package:planor/widgets/design_input.dart';
import 'package:planor/widgets/design_selection.dart';

class ActivityEditPage extends StatefulWidget {
  const ActivityEditPage({Key? key, this.activity}) : super(key: key);

  final Activity? activity;

  @override
  State<ActivityEditPage> createState() => _ActivityEditPageState();
}

class _ActivityEditPageState extends State<ActivityEditPage> {
  late ActivityEditController controller;

  @override
  void initState() {
    controller = ActivityEditController(widget.activity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => DesignSelection<StudyType?>(
                  items: studyTypes,
                  value: studyTypes.firstWhereOrNull(
                    (studyType) => studyType == controller.studyType.value,
                  ),
                  hint: 'Tipo de Atividade',
                  onChanged: controller.setStudyType),
            ),
            Obx(
              () => DesignSelection<Area?>(
                items: areas,
                value: areas.firstWhereOrNull(
                  (area) => area == controller.grandArea.value,
                ),
                hint: 'Materia',
                onChanged: controller.setGrandArea,
              ),
            ),
            DesignSelection<Book?>(
                items: controller.books,
                value: controller.books.firstWhereOrNull(
                        (book) => book.uuid == controller.bookId.value),
                hint: 'Conteudo',
                onChanged: controller.setBook),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
