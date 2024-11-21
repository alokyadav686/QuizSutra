import 'package:flutter/material.dart';
import 'package:quizsutra/ui/quizcode.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


   @override
  void initState() {

    super.initState();

    Timer(Duration(seconds: 3),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Quizcode()));



    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splashbest.png"),fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 250,
            // ),
            Container(
              height: 422,
              width: 340,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.65),
                borderRadius: BorderRadius.circular(50),
                
              ),
              child: Column(
                children: [
                  SizedBox(height: 47,),
                  Container(
                    
                    height: 162,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(image: AssetImage("assets/images/loggo.png"))
                    ),
                  ),
                  SizedBox(height: 22,),
                  Text("QuizSutra",style: TextStyle(fontSize: 48,letterSpacing: 2,color: Colors.white,fontWeight: FontWeight.w700),),
                  SizedBox(height: 32,),

                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    strokeWidth: 4,
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}