import 'package:flutter/material.dart';


class InputWidget extends StatefulWidget {

  final bool obscureText;
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextStyle textStyle;
  final TextEditingController controller;


  InputWidget({
    Key key,
    this.hintText,
    this.iconData,
    this.onChanged,
    this.textStyle,
    this.controller,
    this.obscureText=false
  }):super(key:key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: new InputDecoration(
        hintText: widget.hintText,
        icon: widget.iconData == null ? null : new Icon(widget.iconData),
      ),
    );
  }
}
