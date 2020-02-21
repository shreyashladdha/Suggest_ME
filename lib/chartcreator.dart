import 'package:flutter/material.dart';

class create_chart extends StatefulWidget {

  var data;
  // const create_chart(this.data);
  create_chart(var data)
  {
    this.data= data;
  }

  @override
  _create_chartState createState() => _create_chartState();
}

class _create_chartState extends State<create_chart> {
  var data;
  _create_chartState(var data){
    this.data= data;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}