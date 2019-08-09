import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class FirstRefreshView extends StatefulWidget {
  @override
  _FirstRefreshViewState createState() => _FirstRefreshViewState();
}

class _FirstRefreshViewState extends State<FirstRefreshView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SpinKitCircle(color: Colors.white),
    );
  }
}
