import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:young_motion/core/models/employess_model/employee_details_model.dart';
import 'package:young_motion/core/repository/employees_service/employee_service_impl.dart';
import 'package:young_motion/features/emloyee_details.dart/widgets/rating_container.dart';
import 'package:young_motion/features/emloyee_details.dart/widgets/review_card.dart';

@RoutePage()
class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen(
      {super.key, @PathParam('employeeId') this.employeeId = -1});
  final int employeeId;

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final EmployeeServiceImpl _employeeService = EmployeeServiceImpl();

  EmployeeDetailsModel? _employee;

  @override
  void initState() {
    super.initState();
    _loadEmployee();
  }

  Future<void> _loadEmployee() async {
    var employee = await _employeeService
        .getEmployeeDetailsByID(widget.employeeId); // Получаем 10 сотрудников
    setState(() {
      _employee = employee;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_employee == null) {
      return CircularProgressIndicator();
    } else
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.router.maybePopTop();
                },
                icon: Icon(Icons.arrow_back)),
            title: Text("Профиль сотрудника"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade200, width: 1.5),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4.0),
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white70,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              _employee!.employee.avatar_url),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _employee!.employee.full_name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          _employee!.employee.post,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        RatingContainer(
                                            rating: _employee!.employee.rating)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "О мне",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ExpandableText(
                                _employee!.employee.description,
                                trimType: TrimType.lines,
                                trim: 4,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    height: 1.4),
                                linkTextStyle:
                                    TextStyle(fontSize: 14, color: Colors.blue),
                                readMoreText: "еще",
                                readLessText: "свернуть",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "Отзывы",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 16, bottom: 16),
                          height: 152,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _employee!.reviews.length,
                            itemBuilder: (context, index) {
                              return ReviewCard(
                                  reviewModel: _employee!.reviews[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 8);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'Оставить отзыв',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
  }
}
