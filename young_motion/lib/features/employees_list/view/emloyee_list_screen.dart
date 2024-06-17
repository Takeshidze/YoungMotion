import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:young_motion/core/models/employess_model/employee.dart';
import 'package:young_motion/core/repository/employees_service/employee_service_impl.dart';
import 'package:young_motion/core/widgets/employee_card.dart';
import 'package:young_motion/routes/app_router.dart';

@RoutePage()
class EmloyeesListScreen extends StatefulWidget {
  const EmloyeesListScreen({super.key});

  @override
  State<EmloyeesListScreen> createState() => _EmloyeesListScreenState();
}

class _EmloyeesListScreenState extends State<EmloyeesListScreen> {
  final EmployeeServiceImpl _employeeService = EmployeeServiceImpl();

  List<Employee> _employees = [];

  @override
  void initState() {
    super.initState();
    _loadEmployees();
  }

  Future<void> _loadEmployees() async {
    var employees =
        await _employeeService.getAllEmployees(); // Получаем 10 сотрудников
    setState(() {
      _employees = employees;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.router.maybePopTop();
          },
        ),
        title: Text(
          'Сотрудники',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // количество столбцов
                  childAspectRatio: 3 / 4,
                ),
                itemCount: _employees.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushRoute(EmployeeDetailsRoute(
                          employeeId: _employees[index].id));
                    },
                    child: EmployeeCard(
                      employee: _employees[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
