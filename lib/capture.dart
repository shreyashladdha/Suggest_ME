import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:suggetme/resultDisplay.dart';

// import 'package:camera/camera.dart';
class capture extends StatefulWidget {
  @override
  _captureState createState() => _captureState();
}

class _captureState extends State<capture> {
  File imageFile;

  _openGallary(BuildContext context) async {
    var temp = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = temp;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var temp = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = temp;
    });
    Navigator.of(context).pop();
  }

  dynamic responseJson;

  submitForm(BuildContext context) async {

    Dio dio= new Dio();
    Response result;
    FormData formdata =new FormData();
    formdata.add("image",base64Encode(imageFile.readAsBytesSync()));
    result=await(dio.post("http://192.168.0.5:5000/predict",data: formdata,options: Options(method: 'POST',
    responseType: ResponseType.json))
    );
    print(jsonDecode(result.toString()));
    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => resultsDisp(result)));

  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                //mainAxis: align,
                children: <Widget>[
                  GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.photo_size_select_actual,
                          size: 50.0,
                          color: Colors.black54,
                        ),
                        Text("Gallary")
                      ],
                    ),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.camera,
                          size: 50.0,
                          color: Colors.black54,
                        ),
                        Text("Camera")
                      ],
                    ),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (imageFile == null)
                Text("No image selected")
              else
                Image.file(
                  imageFile,
                  width: 400,
                  height: 400,
                ),
              RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Select image"),
              ),
              if (imageFile != null)
                RaisedButton(
                  onPressed: () {
                    submitForm(context);
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => results()));
                  },
                  child: Text("upload"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
