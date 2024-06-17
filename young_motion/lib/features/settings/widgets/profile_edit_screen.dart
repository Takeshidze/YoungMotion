import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/profile.dart';
import 'package:young_motion/core/repository/profile_service/profile_service_impl.dart';

@RoutePage()
class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final ProfileServiceImpl _profileService = ProfileServiceImpl();
  late Future<ProfileModel> _profile;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _profile = _loadProfile();
  }

  Future<ProfileModel> _loadProfile() async {
    ProfileModel profile = await _profileService.getProfile();
    return profile;
  }

  void _openImagePicker() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _updateProfilePicture() async {
    final _supabase = Supabase.instance.client;
    if (_image != null) {
      var uuid = Uuid();
      final fileExtension = uuid.v4();
      final fileName = 'profile_picture.${fileExtension}';
      final uploadResponse =
          await _supabase.storage.from('avatars').upload(fileName, _image!);
      final String publicUrl =
          _supabase.storage.from('avatars').getPublicUrl(fileName);

      await _supabase.from('profiles').update({
        'first_name': _nameController.text,
        'second_name': _surnameController.text,
        'avatar_url': publicUrl
      }).eq('id', _supabase.auth.currentUser!.id);
    } else {
      await _supabase.from('profiles').update({
        'first_name': _nameController.text,
        'second_name': _surnameController.text
      }).eq('id', _supabase.auth.currentUser!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: FutureBuilder<ProfileModel>(
              future: _profile,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _nameController.text = snapshot.data!.first_name;
                  _surnameController.text = snapshot.data!.second_name;
                  return Column(
                    children: [
                      InkWell(
                        onTap: _openImagePicker,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          backgroundImage: _image != null
                              ? FileImage(_image!) as ImageProvider
                              : snapshot.data!.avatarUrl != ''
                                  ? NetworkImage(snapshot.data!.avatarUrl)
                                      as ImageProvider
                                  : null,
                          child:
                              snapshot.data!.avatarUrl == '' && _image == null
                                  ? Icon(Icons.add_a_photo, size: 30)
                                  : null,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Введите имя',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите имя';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _surnameController,
                        decoration: const InputDecoration(
                            hintText: 'Введите фамилию',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите фамилию';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _updateProfilePicture();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Profile updated successfully')));
                                  context.router.maybePop();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Text(
                                'Сохранить',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
