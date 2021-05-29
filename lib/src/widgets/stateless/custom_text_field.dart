import 'package:flutter/material.dart';
import 'package:foodhub/src/util/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? titleText;
  final String hintText;
  final double height;
  final Color? backgroundColor;
  final Color borderColor;
  final bool hasBorder;
  final Widget? suffixIcon;
  final double paddingVertical;
  final double radius;
  final bool isAlignText;
  final TextEditingController? controller;
  final TextStyle? styleText;
  final TextStyle? styleHintText;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool enable;
  final TextInputType keyboardType;
  final Function(String)? onValueChanged;
  final Function(String)? onCompleted;

  const CustomTextField({
    Key? key,
    this.titleText,
    this.hintText = 'Place holder',
    this.backgroundColor,
    this.isAlignText = false,
    this.enable = true,
    this.focusNode,
    this.onCompleted,
    this.height = 50,
    this.borderColor = Colors.red,
    this.suffixIcon,
    this.paddingVertical = 3,
    this.radius = 22,
    this.controller,
    this.hasBorder = false,
    this.styleText,
    this.styleHintText,
    this.keyboardType = TextInputType.text,
    this.onValueChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText!,
            style: TextStyle(color: Color(0xffffADADB8)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: height,
            // padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                  color: hasBorder ? borderColor : Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(16, paddingVertical, 16, paddingVertical),
              child: TextField(
                cursorColor: MyColors.white,
                textAlign:
                    isAlignText == true ? TextAlign.center : TextAlign.start,
                controller: controller,
                focusNode: focusNode,
                style: styleText,
                enabled: enable,
                textInputAction: TextInputAction.done,
                keyboardType: keyboardType,
                onChanged: onValueChanged,
                onSubmitted: onCompleted,
                decoration: InputDecoration(
                  hintStyle: styleHintText,
                  hintText: hintText,
                  border: InputBorder.none,
                  suffixIcon: suffixIcon,
                ),
                autocorrect: false,
                obscureText: obscureText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
