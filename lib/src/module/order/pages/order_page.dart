import 'package:flutter/material.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext ctx, int index) {
            return _buildOrderItem();
          }),
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
                  child: Image.asset(UIData.image1)),
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
}
