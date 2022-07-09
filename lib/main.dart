import 'package:flutter/material.dart';
import 'package:jb_shop/shared/size_fit.dart';
import 'package:jb_shop/views/tabs/tabs.dart';

import 'routes/routes.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialze();
    return MaterialApp(
      title: "商城",
      // home: const TabsScreen(),
      initialRoute: TabsScreen.routeName,
      routes: routes,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
