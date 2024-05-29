import 'package:young_motion/core/models/person.dart';

abstract class PersonRepository {
  Future<void> savePerson(Person person);
}

class PersonRepositoryImpl extends PersonRepository {
  @override
  Future<void> savePerson(Person person) async {
    // реализация сохранения данных в базе данных или файле
  }
}
