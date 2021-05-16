import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';
import 'package:foodhub/src/widgets/stateful/filled_round_button.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({Key key}) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  EdgeInsets padding;
  Size size;

  @override
  Widget build(BuildContext context) {
    padding = MediaQuery.of(context).padding;
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageFood(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Cơm chiên trứng",
              style: StylesText.body30RegularSFProText,
            ),
          ),
          _buildIncreaseDecrease(),
          _buildDescription(),
          _buildButtonAddCart(),
          // _buildReview()
        ],
      ),
    );
  }

  Widget _buildImageFood() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Image.asset(
            UIData.image1,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration:
                BoxDecoration(gradient: MyColors.gradient_black_to_grey),
          ),
          Positioned(
            left: 15,
            right: 15,
            top: padding.top,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Container(
                    decoration: BoxDecoration(
                        color: MyColors.tanHide,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.favorite_sharp)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncreaseDecrease() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "\$8.99",
            style: StylesText.body21CenterBoldWhite,
          )),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10,
          ),
          Text("02"),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
          "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder."),
    );
  }

  Widget _buildButtonAddCart() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        width: 130,
        height: 40.0,
        child: FilledRoundButton.withColor(
          radius: 28,
          pureColor: MyColors.tanHide,
          prefIcon: Image.asset(
            UIData.ic_cart,
          ),
          text: Text(
            "Add to cart",
            style: Theme.of(context)
                .textTheme
                .headline
                .merge(TextStyle(color: Colors.white)),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildReview() {
    return Padding(
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
    );
  }
}
