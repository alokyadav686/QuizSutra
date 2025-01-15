import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizsutra/apiservices.dart';
import 'package:quizsutra/leaderboard/resultscreen.dart';
import 'package:quizsutra/ui/practicequiz.dart';

class Quizscreen3 extends StatefulWidget {
  const Quizscreen3({super.key});

  @override
  State<Quizscreen3> createState() => _Quizscreen3State();
}

class _Quizscreen3State extends State<Quizscreen3> {
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
          submitbtn();
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
      var questionss= data["reasoning"];
      List<Map<String, String>> resultData = [];
      
      for(int i= 0;i<questionss.length; i++){
        String userAnswer = selectedAnswers[i];
        String correctAnswer = questionss[i]["correctAnswer"];

        if(userAnswer==correctAnswer){
          score+=10;
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
      
          drawer: Drawer(
  backgroundColor: Colors.purple,
  child: SingleChildScrollView(
    child: Column(
      children: [
    
                  SizedBox(height: 50,),
            Text("Reasoning Quiz", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.white),),
        
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white)));
              }
              if (snapshot.hasData) {
                var quizData = snapshot.data["reasoning"];
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: quizData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentQuestionindex = index;
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white.withOpacity(0.7)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text("Q${index + 1}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }
            },
          ),
        ),
        
    
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: InkWell(
            onTap: () {
              submitbtn();
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Submit Quiz",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.purple),),
                  Icon(Icons.subdirectory_arrow_left,color: Colors.purple,),
                ],
              ),
            ),
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 2),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Practicequiz()));
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cancel_presentation_sharp,color: Colors.purple,),
                  SizedBox(width: 4,),
                  Text("Quit",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.purple),)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
      body: Padding(
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
          
                        var quizData = snapshot.data["reasoning"];
                        var questions = quizData;
      
                        if (selectedAnswers.length < questions.length) {
                          selectedAnswers = List.generate(
                              questions.length, (index) => '');
                        }
          
      
                        // if(isloaded==false){
                        //   optionsList = questions[currentQuestionindex]["options"];
          
                        //   isloaded =true;    
                          
          
                        // }
          
                        return SizedBox(
                          height: MediaQuery.of(context).size.height/2+30,
                          child: SingleChildScrollView(
                            child: Column(
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
                                                                                 child: Text(questions[currentQuestionindex]["questionText"],style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),),
                                                                               ),
                                                                              ),
                            
                                      SizedBox(height: 40,),
                                      
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: questions[currentQuestionindex]["options"].length,
                                        itemBuilder: (BuildContext context, int index){
                                          var option = questions[currentQuestionindex]["options"][index];
                                           bool isSelected = selectedAnswers[currentQuestionindex] == option;
                                  
                                        
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 5),
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
                                              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                              child: Text(option ,style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),),
                                                )),
                                               ),
                                            ),
                                          );
                                        }                                
                                        ),
                                                                                               
                              ],
                            ),
                          ),
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
                       if (currentQuestionindex < 29) {
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
                      child: Center(child: Text(currentQuestionindex!=29?"Next": "submit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),)),
                    
                    ),
                  ),
                  
                ],
              ),
                       
            ],
          ),
        ),
      ),
    );
  }
}
