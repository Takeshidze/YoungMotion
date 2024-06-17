import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';
import 'package:young_motion/core/models/profile.dart';
import 'package:young_motion/core/models/record_model.dart';

abstract class ProfileService {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile();
}

class ProfileServiceImpl implements ProfileService {
  final _supabase = Supabase.instance.client;

  ProfileServiceImpl();

  @override
  Future<ProfileModel> getProfile() async {
    final response = await _supabase.from('profiles').select('''
        first_name,
        second_name,
        avatar_url
        ''').eq('id', _supabase.auth.currentUser!.id).single();
    print(response);
    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
