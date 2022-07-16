import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jb_shop/shared/size_fit.dart';

List<Map<String, String>> tabsConfig = [
  {"label": "综合", "key": "zonghe"},
  {"label": "销量", "key": "xiaoliang"},
  {"label": "价格", "key": "jiage"},
  {"label": "筛选", "key": "shaixuan"},
];

class ProductListScreen extends StatelessWidget {
  static const String routeName = "/product-list";
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ??
            {};
    return ProductListContent(
      cid: arguments["cid"] ?? "",
    );
  }
}

class ProductListContent extends StatefulWidget {
  final String cid;

  const ProductListContent({required this.cid, Key? key}) : super(key: key);

  @override
  State<ProductListContent> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListContent> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String activeTabkey = tabsConfig[0]["key"] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("商品列表"),
        leading: IconButton(
          //注意：新版本的Flutter中加入Drawer组件会导致默认的返回按钮失效，所以我们需要手动加一下返回按钮
          icon: Icon(Platform.isIOS || Platform.isMacOS
              ? Icons.arrow_back_ios_new
              : Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [Text("")],
        automaticallyImplyLeading: true,
      ),
      endDrawer: Drawer(
        child: Text("我是帅哥"),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80.rpx),
            child: buildProductList(),
          ),
          Positioned(
            width: 750.rpx,
            height: 80.rpx,
            child: buildTabs(),
          ),
        ],
      ),
    );
  }

  // tabs 组件
  Widget buildTabs() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.rpx,
            color: const Color.fromRGBO(233, 233, 233, 0.9),
          ),
        ),
      ),
      child: Row(
          children: tabsConfig
              .map(
                (el) => Expanded(
                  flex: 1,
                  child: InkWell(
                    child: SizedBox(
                      height: 78.rpx,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  el["label"] ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: activeTabkey == el["key"]
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: activeTabkey == el["key"]
                                ? Colors.red
                                : Colors.transparent,
                            width: 150.rpx,
                            height: 4.rpx,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        String newKey = el["key"] ?? "";
                        if (newKey == activeTabkey) return;

                        if (newKey == "shaixuan") {
                          return scaffoldKey.currentState?.openEndDrawer();
                        }

                        setState(() {
                          activeTabkey = newKey;
                        });
                      });
                    },
                  ),
                ),
              )
              .toList()),
    );
  }

  /// 商品列表组件
  Widget buildProductList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.rpx),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(height: 20.rpx),
              Row(
                children: [
                  SizedBox(
                    width: 180.rpx,
                    height: 180.rpx,
                    child: Image.network(
                      "https://www.itying.com/images/flutter/list2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10.rpx),
                      height: 180.rpx,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ADSL可飞机阿卡丽省的烦阿萨德李逵负荆阿斯科两地分居阿萨德李逵负荆阿斯科两地分居看阿斯顿发立卡接受的垮落法",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10.rpx),
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.rpx),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.rpx),
                                  color:
                                      const Color.fromRGBO(230, 230, 230, 0.9),
                                ),
                                child: Text("4G"),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.rpx),
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.rpx),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.rpx),
                                  color:
                                      const Color.fromRGBO(230, 230, 230, 0.9),
                                ),
                                child: Text("4G"),
                              ),
                            ],
                          ),
                          Text(
                            "￥990",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.red, fontSize: 32.rpx),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.rpx),
              Divider(
                height: 1.rpx,
              )
            ],
          );
        },
      ),
    );
  }
}
