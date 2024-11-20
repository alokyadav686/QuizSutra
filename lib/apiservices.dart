import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

var link = "assets/sampleapi/quizData.json";

Future getQuiz() async{
  String res =await rootBundle.loadString("assets/sampleapi/quizData.json");

  var data = jsonDecode(res);
  print("Data fetched from assets");
    return data;
  
}