import 'package:flutter/material.dart';




class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  String _str = "等一会";

  req() async{
    await Future.delayed(Duration(seconds: 5));
    return 'ok';
  }

  doSomeThing()async{
    String data = await req();
    data = 'ok';
    return data;
  }

  render(){
    doSomeThing().then((value){
      _str = value;
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('await'),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Text("$_str"),
            ),
            Center(
              child: IconButton(
                  icon: Icon(Icons.star),
                  onPressed: render),
            )
          ],
        ),
      ),
    );
  }
}
