import 'package:flutter/material.dart';


class PageItem extends StatelessWidget {
  final String title;

  PageItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('$title'),
        Icon(Icons.chevron_right)
      ],
    );
  }
}
