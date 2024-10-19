import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management_with_query_params/enums/home_page_tab.dart';
import 'package:state_management_with_query_params/enums/user_page_tab.dart';
import 'package:state_management_with_query_params/home/home_page.dart';
import 'package:state_management_with_query_params/user/favorite_color/favorite_color_page.dart';
import 'package:state_management_with_query_params/user/username/username_page.dart';
import 'package:collection/collection.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const MainApp());
}

final _router = GoRouter(
  initialLocation: HomePage.routePath,
  routes: [
    GoRoute(
      path: HomePage.routePath,
      name: HomePage.routeName,
      builder: (context, state) {
        final tab = state.uri.queryParameters['tab'];
        final subTab = state.uri.queryParameters['subTab'];

        return HomePage(
          tab: HomePageTab.values.firstWhereOrNull((e) => e.name == tab),
          subTab: UserPageTab.values.firstWhereOrNull((e) => e.name == subTab),
        );
      },
    ),
    GoRoute(
      path: UsernamePage.routePath,
      name: UsernamePage.routeName,
      builder: (context, state) => const UsernamePage(),
    ),
    GoRoute(
      path: FavoriteColorPage.routePath,
      name: FavoriteColorPage.routeName,
      builder: (context, state) => const FavoriteColorPage(),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
