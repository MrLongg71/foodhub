import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';
import 'package:foodhub/src/widgets/stateful/filled_round_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  bool _isShowOrderTotal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      title: Text("Orders"),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext ctx, int index) {
                return _buildOrderItem();
              }),
        ),
        _buildButtonCheckout(),
      ],
    );
  }

  Widget _buildOrderItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    UIData.image1,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Cơm ức gà xối mỡ \n',
                        style: StylesText.body21CenterRegularWhite,
                        children: <TextSpan>[
                          TextSpan(
                              text: '300000',
                              style: StylesText.body15LeftW500TanHide),
                        ],
                      ),
                    ),
                    _buildIncreaseDecrease(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncreaseDecrease() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
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

  Widget _buildPromoCode() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.bgTextField,
          border: Border.all(color: MyColors.greyBlack),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.only(left: 5, right: 5),
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
                  hintText: "Input Gift",
                  border: InputBorder.none),
            ),
          ),
          FilledRoundButton.withColor(
            radius: 10,
            pureColor: MyColors.tanHide,
            text: Text(
              "Apply",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .merge(TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTotalItem(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          RichText(
            text: TextSpan(
              text: value + " ",
              style: StylesText.body14RegularWhite,
              children: <TextSpan>[
                TextSpan(
                  text: 'USD',
                  style: TextStyle(
                      color: MyColors.slate,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      fontSize: 12.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      height: 1,
      color: MyColors.grey,
    );
  }

  Widget _buildButtonCheckout() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 30, right: 30),
      width: double.infinity,
      height: 50.0,
      child: FilledRoundButton.withColor(
        radius: 28,
        pureColor: MyColors.tanHide,
        text: Text(
          "Checkout",
          style: Theme.of(context)
              .textTheme
              .headline5
              .merge(TextStyle(color: Colors.white)),
        ),
        onTap: () {
          if(!_isShowOrderTotal){
            showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) {
                  _isShowOrderTotal = true;
                  return _buildTotalOrder();
                });
          }else{
            _isShowOrderTotal = false;
            Navigator.of(context).pop();

          }
        },
      ),
    );
  }

  Widget _buildTotalOrder() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Column(
        children: [
          _buildPromoCode(),
          _buildTotalItem("Subtotal", "\$52.25"),
          _buildLine(),
          _buildTotalItem("Gift", "\$10.25"),
          _buildLine(),
          _buildTotalItem("Total", "\$42.25"),
          _buildButtonCheckout(),
        ],
      ),
    );
  }
}
