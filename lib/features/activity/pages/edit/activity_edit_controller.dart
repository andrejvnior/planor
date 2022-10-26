import 'package:get/get.dart';
import 'package:planor/features/activity/models/activity.dart';
import 'package:planor/features/activity/repositories/activity_repository.dart';
import 'package:planor/features/book/models/book.dart';
import 'package:planor/features/custom_alarm/models/alarm_type.dart';
import 'package:planor/features/custom_alarm/models/custom_alarm.dart';
import 'package:planor/models/area.dart';
import 'package:planor/models/study_type.dart';

class ActivityEditController extends GetxController {
  ActivityEditController(this.originalActivity) {
    activity = originalActivity?.copyWith() ??
        Activity(
          studyType: studyType.value.id,
          grandArea: grandArea.value.id,
          bookId: bookId.value,
          start: start.value,
          end: end.value,
          alarmType: alarmType.value,
          customAlarmId: customAlarmId.value,
        );
  }

  final ActivityRepository repository = Get.find();

  final List<Book> books = Get.find();

  late Activity activity;
  Activity? originalActivity;

  var studyType = StudyType().obs;
  var grandArea = Area().obs;
  var bookId = ''.obs;
  var start = DateTime.now().obs;
  var end = DateTime.now().obs;
  var alarmType = AlarmType.stopwatch.obs;
  var customAlarmId = ''.obs;

  void setStudyType(StudyType? v) => studyType(v);

  void setGrandArea(Area? v) => grandArea(v);

  void setBook(Book? v) => bookId(v?.uuid);

  void setStart(DateTime v) => start(v);

  void setEnd(DateTime v) => end(v);

  void setAlarmType(int v) => alarmType(v);

  void setCustomAlarm(CustomAlarm v) => customAlarmId(v.uuid);

  Future<void> save() async => await repository.save(activity);
}
