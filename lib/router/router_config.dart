import 'package:flutter/cupertino.dart';
import 'package:food_delivery/model/item_model.dart';
import 'package:food_delivery/navigation/navigation.dart';
import 'package:food_delivery/router/router.dart';
import 'package:food_delivery/screens/home_page.dart';
import 'package:food_delivery/screens/likedproduct_page.dart';
import 'package:food_delivery/screens/map_page.dart';
import 'package:food_delivery/screens/product_page.dart';
import 'package:food_delivery/screens/search_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routers.navigation.path,
    name: Routers.navigation.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: Navigation());
    },
  ),
  GoRoute(
    path: Routers.homepage.path,
    name: Routers.homepage.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: HomePage());
    },
  ),
  GoRoute(
    path: Routers.productpage.path,
    name: Routers.productpage.name,
    pageBuilder: (context, state) {
      return CupertinoPage(child: ProductPage(model: state.extra as ItemModel));
    },
  ),
  GoRoute(
    path: Routers.searchpage.path,
    name: Routers.searchpage.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: SearchPage());
    },
  ),
  GoRoute(
  path: "${Routers.mappage.path}/:flag/:pad",
  name: Routers.mappage.name,
  pageBuilder: (context, state) {
    final String flagValue = state.pathParameters['flag']!; 
    return CupertinoPage(
      child: MapPage(
        flag: flagValue == 'true',
        pad: int.parse(state.pathParameters['pad'] ?? '100'),
      ),
    );
  },
),
  GoRoute(
    path: Routers.likedproductpage.path,
    name: Routers.likedproductpage.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: LikedProductPage());
    },
  ),
]);
