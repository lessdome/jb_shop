import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:jb_shop/shared/size_fit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print(SizeFit.screenWidth);
    print(SizeFit.screenHeight);
    print(SizeFit.physicalWidth);
    print(SizeFit.physicalHieght);
    print(SizeFit.statusHeight);
    print(SizeFit.safeBottomHeight);
    return ListView(
      children: [
        buidlSwiper(),
        const SizedBox(height: 10),
        buildTitle("猜你喜欢"),
        const SizedBox(height: 10),
        buildTitle("热门推荐"),
      ],
    );
  }

  /// 录播图
  Widget buidlSwiper() {
    List<Map<String, String>> imageList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];

    return SizedBox(
      height: 375.rpx,
      child: Swiper(
        autoplay: true,
        pagination: const SwiperPagination(),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imageList[index]["url"] ?? "",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  /// title 组件
  Widget buildTitle(String title) {
    return Container(
      height: 34.rpx,
      margin: EdgeInsets.symmetric(horizontal: 20.rpx),
      padding: EdgeInsets.symmetric(horizontal: 20.rpx),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.red,
            width: 10.rpx,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 24.rpx,
        ),
      ),
    );
  }
}
