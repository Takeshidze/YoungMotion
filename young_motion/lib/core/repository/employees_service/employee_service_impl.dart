import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/employess_model/employee.dart';
import 'package:young_motion/core/models/employess_model/employee_details_model.dart';

import 'employee_service.dart';

class EmployeeServiceImpl implements EmployeeService {
  final _supabase = Supabase.instance.client;

  EmployeeServiceImpl();

  @override
  Future<List<Employee>> getEmployees(int limit) async {
    final response = await _supabase.from('employees').select('''
        id,
        full_name,
        avatar_url,
        rating,
        post: post_id(post_name)''').limit(limit);
    print(response);
    return response.map((json) => Employee.fromJson(json)).toList();
  }

  @override
  Future<List<Employee>> getAllEmployees() async {
    final response = await _supabase.from('employees').select('''
        id,
        full_name,
        avatar_url,
        rating,
        post: post_id(post_name)''');
    print(response);
    return response.map((json) => Employee.fromJson(json)).toList();
  }

  @override
  Future<EmployeeDetailsModel> getEmployeeDetailsByID(int id) async {
    final response = await _supabase
        .from('employees')
        .select('''
        id,
        full_name, 
        description, 
        avatar_url, 
        post: post_id(post_name), 
        rating, 
        reviews(
          id, 
          description, 
          stars, 
          created_at, 
          user: created_user_id(avatar_url, first_name, second_name))''')
        .eq('id', id)
        .eq('reviews.employee_id', id)
        .single();

    return EmployeeDetailsModel.fromJson(response);
    // TODO: implement getEmployeeDetailsByID
  }
}
