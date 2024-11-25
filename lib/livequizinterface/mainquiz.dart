import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quizsutra/leaderboard/leaderboard.dart';
import 'package:quizsutra/ui/quizcode.dart';

class Mainquiz extends StatefulWidget {
  final String username;
  final dynamic apiresponse;
  
  const Mainquiz({super.key, required this.username, required this.apiresponse});

  @override
  _MainquizState createState() => _MainquizState();
}

class _MainquizState extends State<Mainquiz> {
  int currentQuestionIndex = 0;
  Map<String, bool> answers = {};
  int score = 0;
  int sec =10;
   Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
     timer?.cancel();
    super.dispose();
  }

  startTimer(){
    setState(() {
      sec=10;
    });
    timer?.cancel();

    timer = Timer.periodic(Duration (seconds: 1), (timer){
      setState(() {
        if (sec >0){
        sec --;
        }
        else{
          
          timer.cancel();
          nextQuestion("");
          // nextQuestion();
        }
        
      });
    });
  }

  void nextQuestion(String selectedAnswer) {
    String correctAnswer = widget.apiresponse["questions"][currentQuestionIndex]["correctAnswer"];
    if(selectedAnswer == correctAnswer) {
      score++;
      answers['Q${currentQuestionIndex + 1}'] = true;
      
    }
    else{
      answers['Q${currentQuestionIndex + 1}'] = false;
    }

    setState(() {
      if(currentQuestionIndex < widget.apiresponse["questions"].length-1) {

        currentQuestionIndex++;
        startTimer();

      }
      else{

        showResult();
      }
    });
  }

  void showResult() {

    timer?.cancel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Quiz Completed",style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.purple,
          content: Text("Your score is: $score / ${widget.apiresponse['questions'].length}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Leaderboard()));
              },
              child: Container(              
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("View Leaderboard",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),),
                ),
              ),
            ),
            SizedBox(height: 10,),

            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Quizcode()));
              },
              child: Container(              
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),),
                ),
              ),
            ),
           
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var quizData = widget.apiresponse;
    var currentQuestion = quizData["questions"][currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Quiz: ${quizData["quizTitle"]}",style: TextStyle(fontSize: 34,color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[

              Column(
                children: [
                  Center(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("$sec", style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                     
                    Stack(
                      children: [
                        Container(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: sec/10,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                          strokeWidth: 8,
                          
                        ),
                        
                        ),
                      ]
                    ),
                    
                    ],
                    
                  ),
                ),
              ),
                ],
              ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Question ${currentQuestionIndex + 1}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
            Text("username : ${widget.username} ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
              ],
            ),
            
            SizedBox(height: 10),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.black26
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(currentQuestion["questionText"],style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              )),
            
            SizedBox(height: 20),

            Column(
              children: List.generate(currentQuestion["options"].length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,  vertical: 4),
                  child: InkWell(
                    onTap: () {
                      nextQuestion(currentQuestion['options'][index]);
                    },
                    child: Container(
                       
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(12)
                        ),
                     
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                        child: Text(currentQuestion["options"][index],style: TextStyle(fontSize: 18, color: Colors.white),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
