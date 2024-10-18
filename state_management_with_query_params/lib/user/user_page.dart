import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

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
      length: 2,
      vsync: this,
    );
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
              text: 'Favourite color',
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
    return const Center(
      child: Text('Username'),
    );
  }

  Widget _getUserFavoriteColorChild() {
    return const Center(
      child: Text('Favorite color'),
    );
  }
}
