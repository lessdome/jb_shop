import 'dart:convert';

import 'package:flutter/material.dart';
import '../home/home.dart';
import '../category/category.dart';
import '../cart/cart.dart';
import '../user/user.dart';

List<Widget> pageList = const [
  HomeScreen(),
  CategoryScreen(),
  CartScreen(),
  UserScreen()
];

class TabsScreen extends StatefulWidget {
  static const String routeName = "/";

  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("京东商城"),
      ),
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        fixedColor: Colors.red,
        items: buildNavigationBarItems(),
        currentIndex: currentIndex,
        onTap: (int index) {
          if (index == currentIndex) return;
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> buildNavigationBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ), 
        label: "首页",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.category,
        ),
        label: "分类",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart,
        ),
        label: "购物车",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.people,
        ),
        label: "分类",
      ),
    ];
  }
}
