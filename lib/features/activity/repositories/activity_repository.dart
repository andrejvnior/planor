import 'package:planor/features/activity/models/activity.dart';
import 'package:planor/repositories/database_repository.dart';

class ActivityRepository extends DataBaseRepository<Activity> {
  ActivityRepository()
      : super(
          name: 'activities',
          fromMap: (document) => Activity.fromMap(document),
        );
}
