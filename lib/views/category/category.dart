import 'package:flutter/material.dart';
import 'package:jb_shop/model/category_model.dart';
import 'package:jb_shop/services/category_request.dart';
import 'package:jb_shop/shared/generate_image_url.dart';
import 'package:jb_shop/shared/size_fit.dart';
import 'package:jb_shop/views/product_list/product_list.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with AutomaticKeepAliveClientMixin {
  int selectIndex = 0;
  List<CategoryModel> categoryList = [];
  List<CategoryModel> categorySecondList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getCategoryListData();
  }

  /// 获取列表数据
  getCategoryListData() async {
    List<CategoryModel> list = await CategoryRequest.getData();
    setState(() {
      categoryList = list;
    });

    getCategoryListDataByPid(list[0].id);
  }

  /// 通过 SelectIndex 获取对应的详细category
  getCategoryListDataByPid(String pid) async {
    List<CategoryModel> list = await CategoryRequest.getData({"pid": pid});
    setState(() {
      categorySecondList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Row(
      children: [
        Container(
          width: 140.rpx,
          height: double.infinity,
          color: Colors.white,
          child: buildLeft(),
        ),
        Expanded(
          flex: 1,
          child: buildRight(),
        )
      ],
    );
  }

  /// 左边的选项列表
  Widget buildLeft() {
    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        CategoryModel item = categoryList[index];
        return Column(
          children: [
            InkWell(
              child: Container(
                height: 130.rpx,
                width: double.infinity,
                color: index == selectIndex
                    ? const Color.fromRGBO(240, 246, 246, 0.9)
                    : Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              onTap: () {
                if (index == selectIndex) return;
                setState(() {
                  selectIndex = index;
                });

                getCategoryListDataByPid(item.id);
              },
            ),
            index != categoryList.length - 1
                ? Divider(
                    height: 1.rpx,
                    color: Colors.black26,
                  )
                : const SizedBox(
                    height: 0,
                  ),
          ],
        );
      },
    );
  }

  ///  右边的商品列表
  Widget buildRight() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.rpx),
      height: double.infinity,
      color: const Color.fromRGBO(240, 246, 246, 0.9),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.35,
          crossAxisSpacing: 20.rpx,
          // mainAxisSpacing: 20.rpx,
        ),
        itemCount: categorySecondList.length,
        itemBuilder: (context, index) {
          CategoryModel item = categorySecondList[index];
          String imageUrl = generateImageUrl(item.pic);
          return InkWell(
            child: Container(
              padding: EdgeInsets.only(top: 20.rpx),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item.title),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, ProductListScreen.routeName,
                  arguments: {"cid": item.id});
            },
          );
        },
      ),
    );
  }
}
