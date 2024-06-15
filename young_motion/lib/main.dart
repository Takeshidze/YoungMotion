import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/app.dart';

import 'features/recording_for_event/person_form/bloc/person_bloc.dart';
import 'features/test.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://ssfaimvrnwbbtsvalnev.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNzZmFpbXZybndiYnRzdmFsbmV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc2MTkxNzYsImV4cCI6MjAzMzE5NTE3Nn0.6Q-MOdZc0Lbf2kgrAznVHo-Lx77Ftv0eH2jCHZTeCJw');
  initializeDateFormatting('ru_RU', null).then((_) {
    runApp(YoungMotion());
  });
}
