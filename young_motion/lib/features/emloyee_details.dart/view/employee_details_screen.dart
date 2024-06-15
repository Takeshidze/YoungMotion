import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:young_motion/core/models/employess_model/employee_details_model.dart';
import 'package:young_motion/core/repository/employees_service/employee_service_impl.dart';

@RoutePage()
class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen(
      {super.key, @PathParam('employeeId') this.employeeId = -3});
  final int employeeId;

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final EmployeeServiceImpl _employeeService = EmployeeServiceImpl();

  EmployeeDetailsModel? _employees;

  @override
  void initState() {
    super.initState();
    _loadEmployee();
  }

  Future<void> _loadEmployee() async {
    var employees = await _employeeService
        .getEmployeeDetailsByID(widget.employeeId); // Получаем 10 сотрудников
    setState(() {
      _employees = employees;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // context.router.removeLast();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(""),
      ),
    );
  }
}
