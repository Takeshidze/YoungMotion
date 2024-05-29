import 'package:flutter/material.dart';
import 'package:young_motion/features/event_list/view/event_listing_screen.dart';
import 'package:young_motion/features/home/view/home_screen.dart';
import 'package:young_motion/features/recording_for_event/view/chechout_screen.dart';
import 'package:young_motion/features/settings/view/settings_screen.dart';
import 'package:young_motion/features/test.dart';

import 'features/autorization/view/autorization_screen.dart';

class YoungMotion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Young Motion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckoutScreen(),
    );
  }
}
