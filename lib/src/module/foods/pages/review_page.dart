import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';
import 'package:foodhub/src/widgets/stateful/filled_round_button.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  EdgeInsets? _padding;

  @override
  Widget build(BuildContext context) {
    _padding = MediaQuery.of(context).padding;
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text("Review"),
      leading: Icon(Icons.arrow_back_ios),
      elevation: 1,
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            _buildImage(),
            SizedBox(
              height: 20,
            ),
            Text(
              "How was your last order Ground Beef  ?",
              style: StylesText.largeTitle,
            ),
            SizedBox(
              height: 20,
            ),
            _buildRatingBar(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Good",
              style: StylesText.titleSelectedLabel,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 7,
              decoration: InputDecoration(
                filled: true,
                fillColor: MyColors.bgTextField,
                contentPadding: EdgeInsets.all(10),
                hintText: "Write review",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            _buildButton()
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        UIData.image1,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRatingBar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      width: double.infinity,
      height: 50.0,
      child: FilledRoundButton.withColor(
        radius: 28,
        pureColor: MyColors.tanHide,
        text: Text(
          "Review",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .merge(TextStyle(color: Colors.white)),
        ),
        onTap: () {},
      ),
    );
  }
}
