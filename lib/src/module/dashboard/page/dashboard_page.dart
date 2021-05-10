import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/src/module/favorite/pages/favorite_page.dart';
import 'package:foodhub/src/module/home/pages/home_page.dart';
import 'package:foodhub/src/module/map/pages/map_page.dart';
import 'package:foodhub/src/module/notification/pages/notification_page.dart';
import 'package:foodhub/src/module/order/pages/order_page.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/route_generator.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  GlobalKey<NavigatorState> homeKey = GlobalKey(debugLabel: 'homeNavigatorKey');
  GlobalKey<NavigatorState> mapKey = GlobalKey(debugLabel: 'mapNavigatorKey');
  GlobalKey<NavigatorState> orderKey =
      GlobalKey(debugLabel: 'orderNavigatorKey');
  GlobalKey<NavigatorState> favoriteKey =
      GlobalKey(debugLabel: 'favoriteNavigatorKey');
  GlobalKey<NavigatorState> notificationKey =
      GlobalKey(debugLabel: 'notificationNavigatorKey');

  GlobalKey<HomePageState> homePageKey = GlobalKey(debugLabel: 'homePageKey');
  GlobalKey<MapPageState> mapPageKey = GlobalKey(debugLabel: 'mapPageKey');
  GlobalKey<OrderPageState> orderPageKey =
      GlobalKey(debugLabel: 'orderPageKey');
  GlobalKey<OrderPageState> favoritePageKey =
      GlobalKey(debugLabel: 'favoritePageKey');
  GlobalKey<NotificationPageState> notificationPageKey =
      GlobalKey(debugLabel: 'notificationPageKey');

  CupertinoTabController _tabController;
  int oldTab = 0;

  List<Widget> listTab;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController();

    listTab = [
      CupertinoTabView(
        builder: (BuildContext context) {
          return HomePage(
            key: homePageKey,
          );
        },
        navigatorKey: homeKey,
        onGenerateRoute: RouteGenerator.routeAll,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return MapPage(
            key: mapPageKey,
          );
        },
        navigatorKey: mapKey,
        onGenerateRoute: RouteGenerator.routeAll,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return OrderPage(
            key: orderPageKey,
          );
        },
        navigatorKey: orderKey,
        onGenerateRoute: RouteGenerator.routeAll,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return FavoritePage(
            key: favoritePageKey,
          );
        },
        navigatorKey: favoriteKey,
        onGenerateRoute: RouteGenerator.routeAll,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return NotificationPage(
            key: notificationPageKey,
          );
        },
        navigatorKey: notificationKey,
        onGenerateRoute: RouteGenerator.routeAll,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      controller: _tabController,
      tabBuilder: (BuildContext context, int index) {
        return listTab[index];
      },
      tabBar: _buildTabBar(),
    );
  }

  Widget _buildTabBar() {
    return CupertinoTabBar(
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: onTabTap,
      activeColor: MyColors.tanHide,
      items: <BottomNavigationBarItem>[
        _buildBottomBarItem(
          Icons.explore,
        ),
        _buildBottomBarItem(
          Icons.place,
        ),
        _buildBottomBarItem(
          Icons.shopping_cart,
        ),
        _buildBottomBarItem(
          Icons.favorite_sharp,
        ),
        _buildBottomBarItem(
          Icons.notifications,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomBarItem(IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon));
  }

  onTabTap(int index) {
    switch (index) {
      case 0:
        if (index != oldTab) {
          break;
        }
        if (homeKey.currentState.canPop()) {
          homeKey.currentState.pop();
        }
        break;
      case 1:
        if (index != oldTab) {
          break;
        }
        if (mapKey.currentState.canPop()) {
          mapKey.currentState.pop();
        }
        break;
      case 2:
        if (index != oldTab) {
          break;
        }
        if (orderKey.currentState.canPop()) {
          orderKey.currentState.pop();
        }
        break;
      case 3:
        if (index != oldTab) {
          break;
        }
        if (favoriteKey.currentState.canPop()) {
          favoriteKey.currentState.pop();
        }
        break;
      case 4:
        if (index != oldTab) {
          break;
        }
        if (notificationKey.currentState.canPop()) {
          notificationKey.currentState.pop();
        }
    }
    oldTab = index;
  }
}
