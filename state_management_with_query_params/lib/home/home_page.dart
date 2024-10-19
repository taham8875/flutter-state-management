import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management_with_query_params/enums/home_page_tab.dart';
import 'package:state_management_with_query_params/enums/user_page_tab.dart';
import 'package:state_management_with_query_params/settings/settings_page.dart';
import 'package:state_management_with_query_params/user/user_page.dart';

class HomePage extends StatefulWidget {
  static const String routePath = '/home';
  static const String routeName = 'home';

  final HomePageTab? tab;
  final UserPageTab? subTab;

  const HomePage({
    super.key,
    required this.tab,
    required this.subTab,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: HomePageTab.values.length,
      vsync: this,
      initialIndex: widget.tab == HomePageTab.settings ? 1 : 0,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          final queryParams = GoRouterState.of(context).uri.queryParameters;

          final newQueryParams = {
            ...queryParams,
            'tab': HomePageTab.user.name,
          };

          final newUri = GoRouterState.of(context).uri.replace(
                queryParameters: newQueryParams,
              );

          GoRouter.of(context).replace(
            newUri.toString(),
          );
        } else if (_tabController.index == 1) {
          final queryParams = GoRouterState.of(context).uri.queryParameters;
          final newQueryParams = {
            ...queryParams,
            'tab': HomePageTab.settings.name,
          };

          final newUri = GoRouterState.of(context).uri.replace(
                queryParameters: newQueryParams,
              );
          GoRouter.of(context).replace(
            newUri.toString(),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text(
        'State Management With Query Params',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _getBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        UserPage(
          subTab: widget.subTab,
        ),
        const SettingsPage(),
      ],
    );
  }

  Widget _getBottomNavigationBar() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
          icon: Icon(Icons.person),
          text: 'User',
        ),
        Tab(
          icon: Icon(Icons.settings),
          text: 'Settings',
        ),
      ],
    );
  }
}
