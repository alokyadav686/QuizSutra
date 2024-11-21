import 'package:flutter/material.dart';
import 'package:quizsutra/ui/practicequiz.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  
  // Constructor to receive the score from the Quizscreen
  ResultScreen({super.key, required this.score});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text("Quiz Completed",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,),),
              SizedBox(height: 20),
              
            
              Text("Your Score: ${widget.score}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,),),
              SizedBox(height: 20),

          
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text("Retry",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple,),),
                  ),
                ),
              ),
              SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Practicequiz()));
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text("Exit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple,),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
