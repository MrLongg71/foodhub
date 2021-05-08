import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double paddingTop;

  @override
  Widget build(BuildContext context) {
    paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
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
                  infoBar: Container(
                      // color: Colors.transparent,
                      child: Stack(
                    children: [
                      Container(
                        height: 300,
                        color: Colors.red,
                      ),
                      Icon(Icons.ac_unit),
                    ],
                  )),
                  appBar: _buildBoxSearch(),
                  minHeight: 60,
                  maxHeight: 200,
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildCateList(),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppbar() {
    return Container(
      margin: EdgeInsets.only(top: paddingTop, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            child: Image.asset(UIData.ic_menu),
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
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
        child: PageView.builder(
            itemCount: (10 / 4).ceil(),
            pageSnapping: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {

              // var dataPage =
              // snapshot.data.skip(index * 4).take(4).toList();

              // var lstItem =
              //     .map((user) => _buildCateItem())
              //     .toList();

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => _buildCateItem(),
              );
            }),
      ),
    );
  }

  Widget _buildCateItem() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white12,
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.all(Radius.circular(80))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Image.asset(UIData.ic_cate1), Text("Burger")],
      ),
    );
  }

  Widget _buildFeatureList(){
    return
  }

  Widget _buildFeatureItem(){
    return Container(
      child: Stack(
        children: [
          Image.asset(UIData.image1),
          Text("McDonald's"),
          Row(children: [

          ],),
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
