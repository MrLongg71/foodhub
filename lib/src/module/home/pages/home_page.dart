import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodhub/src/module/dashboard/page/drawer_menu_page.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double paddingTop;
  int indexSelected;
  PageController pageBannerController;

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    indexSelected = -1;
    pageBannerController = PageController(initialPage: 1);
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (indexSelected < 10) {
        indexSelected++;
      } else {
        indexSelected = 0;
      }

      pageBannerController.animateToPage(
        indexSelected,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Stack(
      children: [
        DrawerMenuPage(),
        _buildBody(),
      ],
    ));
  }

  Widget _buildBody() {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildAppbar(),
            Container(
              color: Colors.white12,
              height: 0.5,
            ),
            Expanded(
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    delegate: _SliverPersistentHeader(
                      infoBar: _buildBannerList(),
                      appBar: _buildBoxSearch(),
                      minHeight: 60,
                      maxHeight: 200,
                    ),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _buildCateList(),
                      _buildTitle(),
                      _buildPopularList(),
                      _buildTitle(),
                      _buildPopularList(),
                      _buildTitle(),
                      _buildPopularList(),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerList() {
    return Container(
      height: 300,
      child: PageView.builder(
        pageSnapping: true,
        controller: pageBannerController,
        onPageChanged: (index) {
          setState(() {
            indexSelected = index;
          });
        },
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildBannerItem();
        },
      ),
    );
  }

  Widget _buildBannerItem() {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: Image.asset(
            UIData.image1,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(bottom: 10, left: 0, right: 0, child: buildSelector()),
      ],
    );
  }

  Widget buildSelector() {
    return Container(
      height: 7,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          buildItem(Color color) => Container(
                width: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: color,
                ),
              );

          if (indexSelected == index) return buildItem(MyColors.orangeLight);
          return buildItem(MyColors.slate);
        },
        itemCount: 10,
        separatorBuilder: (context, index) => Container(
          width: 7,
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      margin: EdgeInsets.only(top: paddingTop, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: InkWell(
                onTap: () {
                  setState(() {
                    if (isDrawerOpen) {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    } else {
                      xOffset = 230;
                      yOffset = 150;
                      scaleFactor = 0.6;
                      isDrawerOpen = true;
                    }
                  });
                },
                child: Image.asset(UIData.ic_menu)),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Deliver to ",
                  style: StylesText.tagLine15SemiBoldWhite,
                ),
                Text(
                  "127 Dong Bac, Quan 12, HCM",
                  style: StylesText.body20tanHide,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: Image.asset(UIData.ic_user_default),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxSearch() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                fillColor: MyColors.bgTextField,
                contentPadding: EdgeInsets.all(10),
                hintText: "Find for food or restaurant",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.bgTextField),
              height: 45,
              width: 45,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  UIData.ic_filter,
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildCateList() {
    return Container(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 10,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _buildCateItem();
            }),
      ),
    );
  }

  Widget _buildCateItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: MyColors.bgTextField,
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.all(Radius.circular(80))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Image.asset(UIData.ic_cate1), Text("Burger")],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "Popular",
            style: StylesText.body21CenterBoldWhite,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: MyColors.bgTextField),
            child: Text("More"),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 230,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, int index) {
            return _buildPopularItem();
          }),
    );
  }

  Widget _buildPopularItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: MyColors.bgTextField, borderRadius: BorderRadius.circular(10)),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  UIData.image1,
                  height: 150,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(top: 10, right: 10, child: Icon(Icons.favorite)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              "McDonald's",
              style: StylesText.body17CenterRegularWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    "4.5",
                    style: StylesText.body12White,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                Spacer(),
                Icon(
                  Icons.mode_comment_outlined,
                  size: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    "5",
                    style: StylesText.body12White,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget infoBar;
  final Widget appBar;
  final double minHeight;
  final double maxHeight;

  _SliverPersistentHeader(
      {this.infoBar, this.appBar, this.minHeight, this.maxHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    bool showAppbar = shrinkOffset >= maxExtent - minExtent;
    return Container(
      color: Theme.of(context).canvasColor,
      alignment: Alignment.topCenter,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: ClipRect(
              child: OverflowBox(
                minHeight: 0.0,
                maxHeight: double.infinity,
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 0,
                    bottom: 0.0,
                  ),
                  child: SafeArea(
                    top: false,
                    bottom: false,
                    child: showAppbar
                        ? MediaQuery.removePadding(
                            context: context,
                            child: appBar,
                            removeBottom: true,
                          )
                        : infoBar,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
