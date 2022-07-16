import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:jb_shop/model/focus_model.dart';
import 'package:jb_shop/model/product_model.dart';
import 'package:jb_shop/services/focus_request.dart';
import 'package:jb_shop/services/product_request.dart';
import 'package:jb_shop/shared/generate_image_url.dart';
import 'package:jb_shop/shared/size_fit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  List<FocusModel> focusList = [];
  List<ProductModel> hotProductList = [];
  List<ProductModel> bestProductList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getFocusList();
    getHotProductList();
    getBestProductList();
  }

  getFocusList() async {
    List<FocusModel> data = await FocusRequest.getData();
    setState(() {
      focusList = data;
    });
  }

  getHotProductList() async {
    List<ProductModel> data = await ProductRequest.getData({"is_hot": 1});
    setState(() {
      hotProductList = data;
    });
  }

  getBestProductList() async {
    List<ProductModel> data = await ProductRequest.getData({"is_best": 1});
    setState(() {
      bestProductList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buidlSwiper(),
        SizedBox(height: 20.rpx),
        buildTitle("猜你喜欢"),
        SizedBox(height: 20.rpx),
        buildHotProductList(),
        SizedBox(height: 10.rpx),
        buildTitle("热门推荐"),
        SizedBox(height: 20.rpx),
        buildRecommendProductList(),
        SizedBox(height: 20.rpx),
      ],
    );
  }

  /// 录播图
  Widget buidlSwiper() {
    return SizedBox(
      height: 375.rpx,
      width: 750.rpx,
      child: focusList.isNotEmpty
          ? Swiper(
              autoplay: true,
              pagination: const SwiperPagination(),
              containerWidth: 750.rpx,
              containerHeight: 375.rpx,
              itemWidth: 750.rpx,
              itemHeight: 375.rpx,
              itemCount: focusList.length,
              itemBuilder: (BuildContext context, int index) {
                String url = generateImageUrl(focusList[index].pic);
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                );
              },
            )
          : null,
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
          fontSize: 26.rpx,
        ),
      ),
    );
  }

  /// 热门商品
  Widget buildHotProductList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.rpx),
      height: 200.rpx,
      width: 750.rpx,
      child: hotProductList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotProductList.length,
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.rpx),
                    height: 140.rpx,
                    width: 140.rpx,
                    child: Image.network(
                      generateImageUrl(hotProductList[index].pic),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "￥${hotProductList[index].price}",
                    style: TextStyle(fontSize: 24.rpx, color: Colors.red),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  /// 热门推荐
  Widget buildRecommendProductList() {
    List<Widget> children =
        bestProductList.map((el) => buildRecommendProductItem(el)).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.rpx),
      child: Wrap(
        runSpacing: 20.rpx,
        spacing: 20.rpx,
        children: children,
      ),
    );
  }

  Widget buildRecommendProductItem(ProductModel item) {
    return Container(
      width: 345.rpx,
      padding: EdgeInsets.all(20.rpx),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.rpx, color: const Color.fromRGBO(233, 233, 233, 0.9)),
        borderRadius: BorderRadius.all(
          Radius.circular(8.rpx),
        ),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(4.rpx),
              ),
              child: Image.network(
                generateImageUrl(item.pic),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.rpx),
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 10.rpx),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "￥${item.price}",
                style: TextStyle(color: Colors.red, fontSize: 32.rpx),
              ),
              Text(
                "￥${item.oldPrice}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 28.rpx,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
        ],
      ),
    );
  }
}
