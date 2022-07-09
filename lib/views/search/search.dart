import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search";

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索页面"),
      ),
      body: const Text("搜索"),
    );
  }
}
