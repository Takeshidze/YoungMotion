import 'package:young_motion/core/models/lesson_date.dart';

abstract class LessonChooserRepository {
  Future<List<LessonDate>> getLessons();
}
