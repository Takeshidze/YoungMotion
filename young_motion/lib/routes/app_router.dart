import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:young_motion/features/autorization/view/autorization_screen.dart';
import 'package:young_motion/features/emloyee_details.dart/view/employee_details_screen.dart';
import 'package:young_motion/features/employees_list/view/emloyee_list_screen.dart';
import 'package:young_motion/features/event_details/view/event_details_screen.dart';
import 'package:young_motion/features/event_list/view/event_listing_screen.dart';
import 'package:young_motion/features/home/view/home_screen.dart';
import 'package:young_motion/features/recording_for_event/view/chechout_screen.dart';
import 'package:young_motion/features/settings/view/settings_screen.dart';
import 'package:young_motion/main_screen.dart';
import 'package:young_motion/routes/auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter() {
    SharedPreferences.getInstance().then((prefs) {
      _preferences = prefs;
    });
  }

  late SharedPreferences _preferences;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            guards: [AuthGuard()],
            path: '/',
            page: RootRoute.page,
            children: [
              AutoRoute(path: 'home', page: HomeTab.page, children: [
                AutoRoute(path: '', page: HomeRoute.page),
                AutoRoute(path: 'employees', page: EmployeeTab.page, children: [
                  AutoRoute(path: '', page: EmloyeesListRoute.page),
                  AutoRoute(
                    path: ':employeeId',
                    page: EmployeeDetailsRoute.page,
                  ),
                ]),
              ]),
              AutoRoute(path: 'profile', page: SettingsRoute.page),
              AutoRoute(path: 'events', page: EmptyRoute.page, children: [
                AutoRoute(path: '', page: EventListingRoute.page),
                AutoRoute(
                    path: ':eventId',
                    page: EventDetailsRoute.page,
                    children: [
                      AutoRoute(path: 'form', page: CheckoutRoute.page),
                    ]),
              ]),
            ]),
        AutoRoute(
          path: '/autorization',
          page: AutorizationRoute.page,
        )
      ];
}

@RoutePage(name: 'EmptyRoute')
class EmptyRoutePage extends AutoRouter {
  const EmptyRoutePage({super.key});
}

@RoutePage(name: 'HomeTab')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'EmployeeTab')
class EmployeeTabPage extends AutoRouter {
  const EmployeeTabPage({super.key});
}
