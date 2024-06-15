import 'package:dio/dio.dart';

const host = "http://26.49.191.57:8000/";

Future<void> health_check() async {
  final dio = Dio();
  try {
    final response = await dio.get(
      host,
    );
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      throw Exception('Invalid response from server');
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<String?> login(String username, String password) async {
  final dio = Dio();
  final formData = {
    'username': username,
    'password': password,
  };
  try {
    final response = await dio.post(
      host + 'auth',
      data: FormData.fromMap(formData),
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    print(response);
    if (response.statusCode == 200 &&
        response.data.containsKey('access_token')) {
      return response.data['access_token'];
    } else {
      throw Exception('Invalid response from server');
    }
  } catch (e) {
    print(e);
    return null;
  }
}
