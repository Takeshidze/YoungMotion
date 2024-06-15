import 'package:auto_route/auto_route.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter/material.dart';
import 'package:young_motion/routes/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final user = Supabase.instance.client.auth.currentSession;

    if (user == null) {
      // Redirect to login page if user is not logged in
      resolver.next(false);
      router.pushNamed('/autorization');
    } else {
      // Allow navigation to protected route if user is logged in
      resolver.next(true);
    }
  }
}
