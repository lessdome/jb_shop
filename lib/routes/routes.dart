import 'package:flutter/material.dart';

import '../views/product_list/product_list.dart';
import '../views/search/search.dart';
import '../views/tabs/tabs.dart';

Map<String, Widget Function(BuildContext)> routes = {
  TabsScreen.routeName: (BuildContext context) => const TabsScreen(),
  SearchScreen.routeName: (BuildContext context) => const SearchScreen(),
  ProductListScreen.routeName: (BuildContext context) => ProductListScreen()
};

// Route<dynamic>? Function(RouteSettings)? onGenerateRoute =
//     (RouteSettings settings) {
//   String? name = settings.name;
//   //  Widget Function(BuildContext)? viewBuild = routes[name];
//   //  Object? arguments = settings.arguments;

//   if (!routes.containsKey(name)) return null;
// };
