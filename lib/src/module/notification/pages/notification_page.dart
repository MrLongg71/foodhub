import 'package:flutter/material.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(child: _buildListNotify());
  }

  Widget _buildAppbar() {
    return AppBar(
      elevation: 0,
      title: Text("Notification"),
    );
  }

  Widget _buildListNotify() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (ctx, index) {
          return _buildItemNotify();
        });
  }

  Widget _buildItemNotify() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                UIData.image1,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'Đặt món thành công \n',
                style: StylesText.body15LeftW500White,
                children: <TextSpan>[
                  TextSpan(
                      text: '12 tháng 6,2020',
                      style: StylesText.body14SemiBoldGrey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
