import 'package:young_motion/core/models/employess_model/employee.dart';
import 'package:young_motion/core/models/employess_model/employee_details_model.dart';

abstract class EmployeeService {
  Future<List<Employee>> getEmployees(int limit);
  Future<List<Employee>> getAllEmployees();
  Future<EmployeeDetailsModel> getEmployeeDetailsByID(int id);
}
