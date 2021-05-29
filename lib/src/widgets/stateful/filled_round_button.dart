import 'package:flutter/material.dart';

class FilledRoundButton extends StatefulWidget {
  final Gradient? gradientColor;
  final Color? pureColor;
  final double radius;
  final Text? text;
  final Widget? prefIcon;
  final VoidCallback? onTap;

  FilledRoundButton.withGradient({
    @required this.gradientColor,
    this.radius = 5.0,
    this.text,
    this.prefIcon,
    this.onTap,
  }) : this.pureColor = null;

  FilledRoundButton.withColor({
    @required this.pureColor,
    this.radius = 5.0,
    this.text,
    this.prefIcon,
    this.onTap,
  }) : this.gradientColor = null;

  @override
  _FilledRoundButtonState createState() => _FilledRoundButtonState();
}

class _FilledRoundButtonState extends State<FilledRoundButton> {
  @override
  Widget build(BuildContext context) {
    Widget childWidgetButton = widget.prefIcon == null
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child: widget.text),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.prefIcon ?? SizedBox(),
              const SizedBox(width: 5.0),
              Container(
                child: widget.text,
              )
            ],
          );

    return Container(
      decoration: BoxDecoration(
        color: widget.pureColor,
        gradient: widget.gradientColor,
        borderRadius: BorderRadius.circular(
          widget.radius,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
          highlightColor: Colors.transparent,
          onTap: widget.onTap == null ? () => {} : widget.onTap,
          child: childWidgetButton,
        ),
      ),
    );
  }
}
