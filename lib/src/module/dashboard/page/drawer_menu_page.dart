import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';
import 'package:foodhub/src/util/styles.dart';
import 'package:foodhub/src/util/uidata.dart';
import 'package:foodhub/src/widgets/stateful/filled_round_button.dart';

class DrawerMenuPage extends StatefulWidget {
  const DrawerMenuPage({Key key}) : super(key: key);

  @override
  _DrawerMenuPageState createState() => _DrawerMenuPageState();
}

class _DrawerMenuPageState extends State<DrawerMenuPage> {
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: padding.top),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  UIData.image1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Eliad Eendaz",
                style: StylesText.body21CenterBoldWhite,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("prelookstudio@gmail.com"),
            SizedBox(
              height: 30,
            ),
            _buildItemDrawerMenu(
              "My Orders",
              UIData.ic_document,
            ),
            _buildItemDrawerMenu(
              "My Profile",
              UIData.ic_profile,
            ),
            _buildItemDrawerMenu(
              "Delivery Address",
              UIData.ic_location,
            ),
            _buildItemDrawerMenu(
              "Payment Methods",
              UIData.ic_wallet,
            ),
            _buildItemDrawerMenu(
              "Contact Us",
              UIData.ic_message,
            ),
            _buildItemDrawerMenu(
              "Setting",
              UIData.ic_setting,
            ),
            _buildItemDrawerMenu(
              "Helps & FAQs",
              UIData.ic_helps,
            ),
            _buildButtonLogout(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemDrawerMenu(String title, String image) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            width: 20,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Text(
            title,
            style: StylesText.body14SemiBoldWhite,
          ))
        ],
      ),
    );
  }

  Widget _buildButtonLogout() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      width: 130,
      height: 40.0,
      child: FilledRoundButton.withColor(
        radius: 28,
        pureColor: MyColors.tanHide,
        prefIcon: Image.asset(
          UIData.ic_logout,
        ),
        text: Text(
          "Logout",
          style: Theme.of(context)
              .textTheme
              .headline
              .merge(TextStyle(color: Colors.white)),
        ),
        onTap: () {},
      ),
    );
  }
}
