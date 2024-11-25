import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

  var link1 = "https://quizapp-r80t.onrender.com/quizzes/category/Coding";
  var link2 = "https://quizapp-r80t.onrender.com/quizzes/category/Aptitude";
  var link3 = "https://quizapp-r80t.onrender.com/quizzes/category/Reasoning";
  var link4 = "https://quizapp-r80t.onrender.com/QuizEntry/enter";

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


  var allcodingquiz = await http.get(Uri.parse(link1));
  var allaptitudequiz = await http.get(Uri.parse(link2));
  var allreasoningquiz = await http.get(Uri.parse(link3));

   if (allcodingquiz.statusCode == 200 &&
      allreasoningquiz.statusCode == 200 &&
      allaptitudequiz.statusCode == 200) {
    return {
      'codingquiz': jsonDecode(allcodingquiz.body),
      'aptitude': jsonDecode(allaptitudequiz.body),
      'reasoning': jsonDecode(allreasoningquiz.body),
    };

}
}

// Future liveQuiz(quizDa, String quizId) async{

//     var livequiz = await http.post(Uri.parse(link4),
//      headers: {
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode(quizDa),
//   );

//     if (livequiz.statusCode ==200){

//       return jsonDecode(livequiz.body);
//     }

// }
