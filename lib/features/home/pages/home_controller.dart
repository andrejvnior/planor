// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:planor/features/activity/models/activity.dart';
import 'package:planor/features/activity/repositories/activity_repository.dart';
import 'package:planor/features/auth/pages/landing/landing_controller.dart';
import 'package:planor/features/book/models/book.dart';
import 'package:planor/features/book/repositories/book_repository.dart';
import 'package:planor/models/user.dart';

class HomeController extends GetxController {
  HomeController();

  // TODO: Trocar para Student();
  // final Student student = Get.find();

  final activityRepository = Get.put(ActivityRepository());
  final bookRepository = Get.put(BookRepository());

  final _activities = Rx<List<Activity>>([]);
  final _books = Rx<List<Book>>([]);

  @override
  void onInit() {
    super.onInit();
    // _activities.bindStream(activityRepository.read);
    _books.bindStream(bookRepository.read);
    _init();
  }

  void _init() {
    // _initActivities();
    _initBooks();
  }

  void _initActivities() {
    ever(_activities, (activities) => Get.put(activities as List<Activity>));
  }

  void _initBooks() {
    ever(_books, (books) => Get.put(books as List<Book>));
  }
}
