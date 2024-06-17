// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AutorizationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AutorizationScreen(),
      );
    },
    CheckoutRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CheckoutRouteArgs>(
          orElse: () => CheckoutRouteArgs(
                  eventId: pathParams.getInt(
                'eventId',
                -1,
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CheckoutScreen(
          key: args.key,
          eventId: args.eventId,
        ),
      );
    },
    EmloyeesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmloyeesListScreen(),
      );
    },
    EmployeeDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EmployeeDetailsRouteArgs>(
          orElse: () => EmployeeDetailsRouteArgs(
                  employeeId: pathParams.getInt(
                'employeeId',
                -1,
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmployeeDetailsScreen(
          key: args.key,
          employeeId: args.employeeId,
        ),
      );
    },
    EmployeeTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmployeeTabPage(),
      );
    },
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyRoutePage(),
      );
    },
    EventDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailsRouteArgs>(
          orElse: () => EventDetailsRouteArgs(
                  eventId: pathParams.getInt(
                'eventId',
                -1,
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EventDetailsScreen(
          key: args.key,
          eventId: args.eventId,
        ),
      );
    },
    EventListingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EventListingScreen(),
      );
    },
    EventTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventTabPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    HomeTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeTabPage(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileEditScreen(),
      );
    },
    RecordsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecordsScreen(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(),
      );
    },
    SettingsTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsTabPage(),
      );
    },
  };
}

/// generated route for
/// [AutorizationScreen]
class AutorizationRoute extends PageRouteInfo<void> {
  const AutorizationRoute({List<PageRouteInfo>? children})
      : super(
          AutorizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AutorizationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CheckoutScreen]
class CheckoutRoute extends PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    Key? key,
    int eventId = -1,
    List<PageRouteInfo>? children,
  }) : super(
          CheckoutRoute.name,
          args: CheckoutRouteArgs(
            key: key,
            eventId: eventId,
          ),
          rawPathParams: {'eventId': eventId},
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const PageInfo<CheckoutRouteArgs> page =
      PageInfo<CheckoutRouteArgs>(name);
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    this.key,
    this.eventId = -1,
  });

  final Key? key;

  final int eventId;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [EmloyeesListScreen]
class EmloyeesListRoute extends PageRouteInfo<void> {
  const EmloyeesListRoute({List<PageRouteInfo>? children})
      : super(
          EmloyeesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmloyeesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmployeeDetailsScreen]
class EmployeeDetailsRoute extends PageRouteInfo<EmployeeDetailsRouteArgs> {
  EmployeeDetailsRoute({
    Key? key,
    int employeeId = -1,
    List<PageRouteInfo>? children,
  }) : super(
          EmployeeDetailsRoute.name,
          args: EmployeeDetailsRouteArgs(
            key: key,
            employeeId: employeeId,
          ),
          rawPathParams: {'employeeId': employeeId},
          initialChildren: children,
        );

  static const String name = 'EmployeeDetailsRoute';

  static const PageInfo<EmployeeDetailsRouteArgs> page =
      PageInfo<EmployeeDetailsRouteArgs>(name);
}

class EmployeeDetailsRouteArgs {
  const EmployeeDetailsRouteArgs({
    this.key,
    this.employeeId = -1,
  });

  final Key? key;

  final int employeeId;

  @override
  String toString() {
    return 'EmployeeDetailsRouteArgs{key: $key, employeeId: $employeeId}';
  }
}

/// generated route for
/// [EmployeeTabPage]
class EmployeeTab extends PageRouteInfo<void> {
  const EmployeeTab({List<PageRouteInfo>? children})
      : super(
          EmployeeTab.name,
          initialChildren: children,
        );

  static const String name = 'EmployeeTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyRoutePage]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventDetailsScreen]
class EventDetailsRoute extends PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    Key? key,
    int eventId = -1,
    List<PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(
            key: key,
            eventId: eventId,
          ),
          rawPathParams: {'eventId': eventId},
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static const PageInfo<EventDetailsRouteArgs> page =
      PageInfo<EventDetailsRouteArgs>(name);
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    this.key,
    this.eventId = -1,
  });

  final Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [EventListingScreen]
class EventListingRoute extends PageRouteInfo<void> {
  const EventListingRoute({List<PageRouteInfo>? children})
      : super(
          EventListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventTabPage]
class EventTab extends PageRouteInfo<void> {
  const EventTab({List<PageRouteInfo>? children})
      : super(
          EventTab.name,
          initialChildren: children,
        );

  static const String name = 'EventTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeTabPage]
class HomeTab extends PageRouteInfo<void> {
  const HomeTab({List<PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileEditScreen]
class ProfileEditRoute extends PageRouteInfo<void> {
  const ProfileEditRoute({List<PageRouteInfo>? children})
      : super(
          ProfileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecordsScreen]
class RecordsRoute extends PageRouteInfo<void> {
  const RecordsRoute({List<PageRouteInfo>? children})
      : super(
          RecordsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecordsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsTabPage]
class SettingsTab extends PageRouteInfo<void> {
  const SettingsTab({List<PageRouteInfo>? children})
      : super(
          SettingsTab.name,
          initialChildren: children,
        );

  static const String name = 'SettingsTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}
