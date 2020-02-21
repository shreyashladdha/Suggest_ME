import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'chartcreator.dart';
class GraphData{
  final String emotion;
  final double value;

  GraphData(this.emotion,this.value);


}


class resultsDisp extends StatelessWidget {
  var response;
  resultsDisp(var x) {
    this.response = x;
  }

  @override
  Widget build(BuildContext context) {
    String sresult = response.toString();
    var parsedJson = json.decode(sresult);
    print('$parsedJson');
    var data=[
  new GraphData("prediction", double.parse(parsedJson["prediction"]['angry'].toString())),
  new GraphData("prediction", double.parse(parsedJson["prediction"]['angry'].toString())),
    new GraphData("prediction", double.parse(parsedJson["prediction"]['angry'].toString())),
  new GraphData("prediction", double.parse(parsedJson["prediction"]['angry'].toString())),
  new GraphData("prediction", double.parse(parsedJson["prediction"]['angry'].toString())),
  new GraphData("prediction", double.parse(parsedJson["prediction"]['angry'].toString())),

];
print(data);

var series =[
  new charts.Series(
    id: 'Emotions',
    domainFn: (GraphData clickdata, _)=>clickdata.emotion,
    measureFn: (GraphData clickdata,_)=>clickdata.value,
    data: data,
  ),
];
var chart=new charts.BarChart(
  series,
  animate: true,
);
    return Scaffold(
      appBar: AppBar(title: Text("Results")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           // chart,
            Text("ANGRY: " + parsedJson["prediction"]['angry'].toString()),
            SizedBox(
              height: 50,
              
            ),
            Text("DISGUST:  " + parsedJson["prediction"]['disgust'].toString()),
            SizedBox(height: 50),
            Text("FEAR:  " + parsedJson["prediction"]['fear'].toString()),
            SizedBox(height: 50),
            Text("HAPPY:  " + parsedJson["prediction"]['happy'].toString()),
            SizedBox(height: 50),
            Text("NEUTRAL:  " + parsedJson["prediction"]['neutral'].toString()),
            SizedBox(height: 50),
            Text("SAD:  " + parsedJson["prediction"]['sad'].toString()),
            SizedBox(height: 50),
            Text(
                "SURPRISE:  " + parsedJson["prediction"]['surprise'].toString()),
            SizedBox(height: 50),
            Text("ANGRY:"+parsedJson["prediction"]['angry'].toString()),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> create_chart(data)));
            },),
          ],
        ),
        // child: Text(parsedJson["prediction"]['angry'].toString(),),
      ),
    );
  }
}
