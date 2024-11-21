import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizsutra/apiservices.dart';
import 'package:quizsutra/leaderboard/resultscreen.dart';

class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {

  @override
  void initState() {
    
    super.initState();
    quiz =getQuiz();
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
    timer!.cancel();
    isSubmitted =true;

    score =0;
    quiz.then((data){
      var questions= data[0]["question"];
      
      for(int i= 0;i<questions.length; i++){
        if(selectedAnswers[i]==questions[i]["correctAnswer"]){
          score+=25;
        }
      }

    });
    });
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultScreen(score:score)));
  }

   onOptionSelected(String answer) {
    if (!isSubmitted) {
      setState(() {
        selectedAnswers[currentQuestionindex] = answer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
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
                            Text("$minutes : $seconds", style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("min", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                          ],
                        ),
                       
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 5),
                            child: Container(
                            width: 140,
                            height: 140,
                            child: CircularProgressIndicator(
                              value: seconds/60,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              strokeWidth: 8,
                              
                            ),
                            
                            
                                                    ),
                          ),
                        Container(
                          width: 150,
                          height: 150,
                          child: CircularProgressIndicator(
                            value: minutes/30,
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
            
                          var quizData = snapshot.data[0];
                          var questions = quizData["questions"];

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
                          
                               Text("Question ${currentQuestionindex + 1} of ${questions.length}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.white),),
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
                                       child: Text(questions[currentQuestionindex]["question"],style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.white),),
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
                                            padding: const EdgeInsets.symmetric(vertical: 15),
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

// Widget options( String optiontxt,VoidCallback ontap){
//   return InkWell(
//     onTap: ontap,
//     child: Container(
//                                 width: double.infinity,
//                                 // height: 50,
//                                 decoration: BoxDecoration(
//                                 // color: Colors.amber,
//                                  color:Color.fromARGB(255, 114, 20, 131),
//                                 borderRadius: BorderRadius.circular(18)
//                                 ),
//                                 child: Center(child: Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 15),
//                                   child: Text(optiontxt ,style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
//                                 )),
//                               ),
//   );
// }