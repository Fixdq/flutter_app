import 'package:flutter/material.dart';

class FlexButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;
  final double fontSize;
  final MainAxisAlignment mainAxisAlignment;
  final int maxLines;

  // 构造函数
  const FlexButton(
      {Key key,
      this.text,
      this.color,
      this.textColor,
      this.onPress,
      this.fontSize = 20.0,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
      textColor: textColor,
      color: color,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          Expanded(child: Text(
            text,
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.center,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
      onPressed: () {
        this.onPress?.call();
      },
    );
  }
}
