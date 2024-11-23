import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

  var link = "https://quizapp-r80t.onrender.com/quizzes/allQuestions";

Future getQuiz() async{
  String codingquiz =await rootBundle.loadString("assets/sampleapi/codingquiz.json");
  String aptitude =await rootBundle.loadString("assets/sampleapi/aptitude.json");
  String reasoning =await rootBundle.loadString("assets/sampleapi/reasoning.json");

  var dataofcodingquiz = jsonDecode(codingquiz);
    var dataofaptitudequiz = jsonDecode(aptitude);
    var dataofreasoningquiz = jsonDecode(reasoning);
  
  
  return {
      'codingquiz': dataofcodingquiz,
      'aptitude': dataofaptitudequiz,
      'reasoning': dataofreasoningquiz,
      
    };
  
}

Future getallQuiz() async{


  var allquiz = await http.get(Uri.parse(link));

  if(allquiz.statusCode == 200){
    var data = jsonDecode(allquiz.body.toString());
    print("data is loaded for all quiz");
    return data;
  }

}