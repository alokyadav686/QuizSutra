import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizsutra/apiservices.dart';

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
  var isloaded =false;

  var optionsList =[];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                     
                    Container(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: seconds/60,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                      
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
                      if( snapshot.hasData){

                        var quizData = snapshot.data[0];
                        var questions = quizData["questions"];

                        if(isloaded==false){
                          optionsList = questions[currentQuestionindex]["options"];



                          isloaded =true;    

                        }

                        return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    
                         Text("Question ${currentQuestionindex + 1} of ${questions.length}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.white),),
                         SizedBox(height: 10,),
                                  
                                  Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                 border: Border.all(color: Colors.white),
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
                                itemCount: optionsList.length,
                                itemBuilder: (BuildContext context, int index){

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                           width: double.infinity,
                                                                    
                                          decoration: BoxDecoration(
                                         
                                        color:Color.fromARGB(255, 114, 20, 131),
                                        borderRadius: BorderRadius.circular(18)
                                         ),
                                        child: Center(child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(questions[currentQuestionindex]["options"][index] ,style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
                                      )),
                                     ),
                                  );

                                }                                
                                ),
                                                                                       
                      ],
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
                       
            ],
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