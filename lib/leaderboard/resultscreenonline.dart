import 'package:flutter/material.dart';
import 'package:quizsutra/livequizinterface/mainquiz.dart';
import 'package:quizsutra/ui/quizcode.dart';

class Resultscreenonline extends StatefulWidget {
  final int score;
  

  Resultscreenonline({super.key, required this.score,});

  @override
  State<Resultscreenonline> createState() => _ResultscreenonlineState();
}

class _ResultscreenonlineState extends State<Resultscreenonline> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      
                Text("Quiz Completed",style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(height: 20),

                Text(
                  "Your Score: ${widget.score} / 10",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                SizedBox(height:40),

                if (widget.score>=8)
                  Text("Great job! You're a quiz master!",style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w500),)
                else if (widget.score >=5)
                  Text("Not bad! Keep practicing.",style: TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.w500),)
                else
                  Text("Better luck next time!",style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.w500),),

                SizedBox(height: 40),


                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Quizcode()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purple, backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Home Sceen", style: TextStyle(fontSize: 18)),
                ),

                SizedBox(height: 20),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
