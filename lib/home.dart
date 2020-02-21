import 'package:flutter/material.dart';
import 'capture.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: new AppBar(
        title: Text("scanner"),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch
          ,
          
          children: <Widget>[
          RaisedButton(
            child: new Icon(Icons.camera),
            onPressed: () {
              // var hometostock = MaterialPageRoute(builder: BuildContext context);
              //  Navigator.of(context).push(MaterialPageRoute(BuildContext context));
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => capture()));
            },
          ),
        ]),
      ),
    ));
  }
}
