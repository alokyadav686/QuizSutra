import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizsutra/apiservices.dart';
import 'package:quizsutra/leaderboard/resultscreenonline.dart';
import 'package:quizsutra/ui/aboutus.dart';
import 'package:quizsutra/ui/practicequiz.dart';

class Mainquiz extends StatefulWidget {
  final String username;
  const Mainquiz({Key? key, required this.username}) : super(key: key);

  @override
  State<Mainquiz> createState() => _MainquizState();
}

class _MainquizState extends State<Mainquiz> {
  int sec =10;
  Timer? timer;
  late Future quiz;
  var currentQuestionindex =0;
  List<String> selectedAnswers = [];
  bool isSubmitted = false;
  int score =0;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
   quiz =getQuiz();
   startTimer();
   

  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  startTimer(){
    timer = Timer.periodic(Duration (seconds: 1), (timer){
      setState(() {
        if (sec >0){
        sec --;
        }
        else{
          
          timer.cancel();
          gotonextquestion();
        }
        
      });
    });
  }

  gotonextquestion(){

    if(currentQuestionindex<9){

    setState(() {
    //  var isLoaded = false;
    currentQuestionindex++;
      sec=1000;
      // isSubmitted=false;
    });
    startTimer();
    }
    else{
      print('Quiz Completed');  
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Resultscreenonline(score: score,)));
    }
  }

 onOptionSelected(String answer, question) {
    if (!isSubmitted) {
      setState(() {
        selectedAnswers[currentQuestionindex] = answer;
        var correctAnswer = question["correctAnswer"];

        if (answer == correctAnswer) {
          score++;
        }
        // isSubmitted=true;
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        drawer: Drawer(
        backgroundColor: Colors.purple,        
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Container(
              
              width: double.infinity,
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 6,),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.person,color: Colors.purple,size: 40,),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("username",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white),),
                      Text("${widget.username}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.white),),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Practicequiz()));
                },
                child: Container(
                  height: 30,
                  width: 190,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        child: Icon(Icons.quiz_sharp,color: Colors.white,)),
                      Text("Offline Quiz",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(height: 20,),

             Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: InkWell(
                onTap: () {
                  
                },
                child: Container(
                  height: 30,
                  width: 190,
                  // color: Colors.black,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        child: Icon(Icons.leaderboard,color: Colors.white,)),
                      Text("Leaderboard",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(height: 20,),

             Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutus()));
                },
                child: Container(
                  height: 30,
                  width: 190,
                  // color: Colors.black,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        child: Icon(Icons.info,color: Colors.white,)),
                      Text("About Us",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(height: 20,),
             
            
          ],
        ),
      ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              
              
              children: [
                SizedBox(height: 30,),
                
            
                Stack(
                  alignment: Alignment.center,
                  
                  children: [
                      Text("$sec", style: TextStyle(fontSize: 38,color: Colors.white,fontWeight: FontWeight.bold),),
                      Stack(
                        children: [  
                          Container(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                            value: sec/10,
                            valueColor:AlwaysStoppedAnimation(Colors.white),),
                          ),
                        ],
                      ),
            
                    ],
            
                ),
                SizedBox(height: 20,),
                          
                  Container(
                    width: double.infinity,
                 
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
          
                        var quizData = snapshot.data["codingquiz"];
                                //  print(quizData);
                        
                        var questions = quizData["questions"];
                      
                        if (selectedAnswers.length < questions.length) {
                          selectedAnswers = List.generate(
                              questions.length, (index) => '');
                        }         
                        return SizedBox(
                          height: MediaQuery.of(context).size.height-300,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            
                                  Center(child: Text("${quizData["quizTitle"]}",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),
                                  SizedBox(height: 20,),
                            
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("Question ${currentQuestionindex +1}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.white),),
                                     Text("Category : ${questions[currentQuestionindex]["category"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.white),),
                                   ],
                                 ),
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
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: questions[currentQuestionindex]["options"].length,
                                        itemBuilder: (BuildContext context, int index){
                                          var option = questions[currentQuestionindex]["options"][index];
                                           bool isSelected = selectedAnswers[currentQuestionindex] == option;
                                  
                                        
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: InkWell(
                                              onTap: () {
                                  
                                                onOptionSelected(option, questions[currentQuestionindex]);
                                  
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}