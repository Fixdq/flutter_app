import 'package:flutter/material.dart';
import 'package:flutter_app/common/style/global_style.dart';


class LodingDialog extends SimpleDialog {
  final String showText;
  Function callBack;

  LodingDialog(this.showText, this.callBack);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Container(
            decoration: ShapeDecoration(
                color: Color(GlobalColors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('$showText'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
