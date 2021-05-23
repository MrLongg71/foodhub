import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';

class SearchFoodPage extends StatefulWidget {
  const SearchFoodPage({Key key}) : super(key: key);

  @override
  _SearchFoodPageState createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage> {
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
        _buildBoxSearch(),
        _buildFoodList(),
      ],
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios),
      title: Text(
        "Search Food",
      ),
    );
  }

  Widget _buildBoxSearch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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

  Widget _buildFoodList() {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => _buildItemFood(),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2.5 : 3.5),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  Widget _buildItemFood() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: MyColors.bgTextField,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      UIData.image1,
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(top: 10, right: 10, child: Icon(Icons.favorite)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 5, right: 10),
              child: Text(
                "McDonald's",
                style: StylesText.body17CenterRegularWhite,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 5, left: 10, bottom: 10, right: 10),
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
      ),
    );
  }
}
