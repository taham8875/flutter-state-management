import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management_with_query_params/enums/user_page_tab.dart';
import 'package:state_management_with_query_params/user/favorite_color/favorite_color_page.dart';
import 'package:state_management_with_query_params/user/username/username_page.dart';

class UserPage extends StatefulWidget {
  final UserPageTab? subTab;

  const UserPage({
    super.key,
    required this.subTab,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: UserPageTab.values.length,
      vsync: this,
      initialIndex: widget.subTab == UserPageTab.favoriteColor ? 1 : 0,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          final queryParams = GoRouterState.of(context).uri.queryParameters;

          final newQueryParams = {
            ...queryParams,
            'subTab': UserPageTab.username.name,
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
            'subTab': UserPageTab.favoriteColor.name,
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getUserPageTabs(),
      body: _getBody(),
    );
  }

  PreferredSize _getUserPageTabs() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(84),
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              offset: const Offset(0, 0),
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(4),
          indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50.0),
          ),
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          dividerColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          tabs: const [
            Tab(
              text: 'Username',
            ),
            Tab(
              text: 'Favorite color',
            ),
          ],
        ),
      ),
    );
  }

  TabBarView _getBody() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        _getUsernameChild(),
        _getUserFavoriteColorChild(),
      ],
    );
  }

  Widget _getUsernameChild() {
    return Center(
      child: ElevatedButton(
        child: const Text(
          'Go to username page',
        ),
        onPressed: () {
          GoRouter.of(context).push(UsernamePage.routePath);
        },
      ),
    );
  }

  Widget _getUserFavoriteColorChild() {
    return Center(
      child: ElevatedButton(
        child: const Text(
          'Go to favorite color page',
        ),
        onPressed: () {
          GoRouter.of(context).push(FavoriteColorPage.routePath);
        },
      ),
    );
  }
}
