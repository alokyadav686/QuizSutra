import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.purple,
          title: Text("About us",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.65),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Column(
                      children: [
                        Text("QuizSutra",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 30),),
                        SizedBox(height: 20,),
                        Text(
                          "QuizSutra is an engaging and user-friendly quiz app designed to make learning fun and interactive. Whether you’re looking to test your knowledge, prepare for competitive exams, or simply challenge yourself, QuizSutra offers a wide variety of quizzes across multiple categories. With its sleek design, seamless navigation, and dynamic scoring system, QuizSutra ensures an enjoyable experience for users of all ages.",
                          style:TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white,height: 1.6),
                          textAlign: TextAlign.center,
                          
                        ),
                      ],
                    ),
                  ),
                  
                ),
              ),
            ),
          ],
        ),
    );
  }
}