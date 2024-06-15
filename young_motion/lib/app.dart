import 'package:flutter/material.dart';
import 'package:young_motion/features/home/view/home_screen.dart';
import 'package:young_motion/features/recording_for_event/view/chechout_screen.dart';

import 'routes/app_router.dart';

class YoungMotion extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Young Motion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
