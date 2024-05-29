import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:young_motion/app.dart';

import 'features/recording_for_event/person_form/bloc/person_bloc.dart';
import 'features/test.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then((_) {
    runApp(YoungMotion());
  });
}
