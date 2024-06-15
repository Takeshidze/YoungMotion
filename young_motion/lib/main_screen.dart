import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:young_motion/routes/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), EventListingRoute(), SettingsRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Главная',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'События',
              icon: Icon(Icons.event),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Icon(Icons.person),
            ),
          ],
        );
      },
    );
  }
}
