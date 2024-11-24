import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizsutra/apiservices.dart';
import 'package:quizsutra/leaderboard/resultscreen.dart';

class Quizscreen2 extends StatefulWidget {
  const Quizscreen2({super.key});

  @override
  State<Quizscreen2> createState() => _Quizscreen2State();
}

class _Quizscreen2State extends State<Quizscreen2> {
@override
  void initState() {
    
    super.initState();
    quiz =getallQuiz();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  int minutes =29;
  int seconds =59;
  Timer? timer;
  late Future quiz;
  var currentQuestionindex =0;
  // var isloaded =false;
  // var optionsList =[];
  List<String> selectedAnswers = [];
  // var totalquestions = snapshot.data[0]
  bool isSubmitted = false;
  // bool optiontapped = false;
  int score =0;

  startTimer(){
    timer = Timer.periodic(Duration (seconds: 1), (timer){
      setState(() {
        if (seconds >0){
        seconds --;

        }
        if(seconds==0 && minutes>0){
          minutes--;
          seconds=60;
        }
        
        if(minutes==0 && seconds==0 ){
          
          timer.cancel();
        }
        
      });
    });
  }

   submitbtn() {

    setState(() {
    timer?.cancel();
    isSubmitted =true;
    score =0;
    });

    quiz.then((data){
      var questionss= data["aptitude"];
      List<Map<String, String>> resultData = [];
      
      for(int i= 0;i<questionss.length; i++){
        String userAnswer = selectedAnswers[i];
        String correctAnswer = questionss[i]["correctAnswer"];

        if(userAnswer==correctAnswer){
          score+=25;
          // print("true $score");
        }

        resultData.add({
          "question": questionss[i]["questionText"],
          "userAnswer" : userAnswer,
          "correctAnswer": correctAnswer
        });
      }
    // print("Final Score: $score");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultScreen(score:score, resultData: resultData)));
    });
  }

    onOptionSelected(String answer) {
    if (!isSubmitted) {
      setState(() {
        selectedAnswers[currentQuestionindex] = answer;
        print("selected option ${selectedAnswers[currentQuestionindex] = answer}");
        print("selected option ${selectedAnswers}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.purple,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$minutes : $seconds", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("min", style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                          ],
                        ),
                       
                      Stack(
                        children: [
                          Container(
                          width: 110,
                          height: 110,
                          child: CircularProgressIndicator(
                            value: seconds/60,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            strokeWidth: 8,
                            
                          ),
                          
                          ),
                       
                        // Container(
                        //    width: 150,
                        //   height: 150,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(80),
                        //     // color: Colors.white54

                        //     border: Border.all(
                        //      color: Colors.white38, // Border color
                        //            width: 4, // Border width
                        //      ),
                            
                        //   ),


                        // ),
                      
                        ]
                      ),
                      
                      ],
                      
                    ),
                  ),
                ),
                SizedBox(height: 40,),
            
                Container(
                  width: double.infinity,
                  // color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      
                      future: quiz, 
                      builder: (BuildContext context , AsyncSnapshot snapshot){
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(Colors.white)));
                        }
                        if( snapshot.hasData){
            
                          var quizData = snapshot.data["aptitude"];
                          var questions = quizData;

                          if (selectedAnswers.length < questions.length) {
                            selectedAnswers = List.generate(
                                questions.length, (index) => '');
                          }
            

                          // if(isloaded==false){
                          //   optionsList = questions[currentQuestionindex]["options"];
            
                          //   isloaded =true;    
                            
            
                          // }
            
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                               Text("Question ${currentQuestionindex+1} of ${questions.length}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.white),),
                               SizedBox(height: 10,),
                                        
                                        Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                               border: Border.all(color: Colors.white),
                                                                               color: Colors.black26
                                                                               // borderRadius: BorderRadius.circular(8),
                                                                               // boxShadow: [BoxShadow(color: Colors.black26,)],
                                                                              ),
                                                                             child: Padding(
                                                                               padding: const EdgeInsets.all(8.0),
                                                                               child: Text(questions[currentQuestionindex]["questionText"],style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.white),),
                                                                             ),
                                                                            ),
                          
                                    SizedBox(height: 40,),
                                    
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: questions[currentQuestionindex]["options"].length,
                                      itemBuilder: (BuildContext context, int index){
                                        var option = questions[currentQuestionindex]["options"][index];
                                         bool isSelected = selectedAnswers[currentQuestionindex] == option;

                                      
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 10),
                                          child: InkWell(
                                            onTap: () {

                                              onOptionSelected(option);

                                              print("firstdebug ${option}");
                                            },
                                            child: Container(
                                                   width: double.infinity,
                                                                            
                                                  decoration: BoxDecoration(
                                                 
                                                // color:optiontapped?  Color.fromARGB(255, 114, 20, 131): Colors.purple[50],
                                                // color: const Color.fromARGB(255, 30, 29, 30),
                                                color: isSelected ? Colors.black:Colors.black38,
                                                borderRadius: BorderRadius.circular(18)
                                                 ),
                                                child: Center(child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                            child: Text(option ,style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
                                              )),
                                             ),
                                          ),
                                        );
                                      }                                
                                      ),
                                                                                             
                            ],
                          );
                        }
            
                        else{
            
                          return Center( child:  CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),);
            
                        }
                      },
                      
                      )
                  ),
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: currentQuestionindex ==0 ? null: (){
                          setState(() {
                            
                            currentQuestionindex--;
                          });            
                                             
                      },
                      child: Container(
                        width: 150,
                        height: 45,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)
                      
                        ),
                        child: Center(child: Text("Previous",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),)),
                      
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                         if (currentQuestionindex < 9) {
                                setState(() {
                                  currentQuestionindex++;
                                  // isloaded = false;
                                  // optiontapped=false;
                                });
                              }
                          else{
                            submitbtn();
                          }    
                        
                      },
                      child: Container(
                        width: 150,
                        height: 45,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)
                      
                        ),
                        child: Center(child: Text(currentQuestionindex!=9?"Next": "submit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),)),
                      
                      ),
                    ),
                    
                  ],
                ),
                         
              ],
            ),
          ),
        ),
      ),
    );
  }
}
