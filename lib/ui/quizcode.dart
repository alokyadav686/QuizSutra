import 'package:flutter/material.dart';

class Quizcode extends StatefulWidget {
  const Quizcode({super.key});

  @override
  State<Quizcode> createState() => _QuizcodeState();
}

class _QuizcodeState extends State<Quizcode> {
  final usernamecontroller =TextEditingController();
  final codeinputcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bg.png"),fit: BoxFit.cover)),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 70),
          child: Container(
            width: double.infinity,
            height: double.infinity,
          
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.65),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 97,bottom: 67),
                  child: Text("QuizSutra",style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold,letterSpacing: 2,color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom : 74),
                  child: Text("Join using code",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white70),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 30,),
                  child: TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.white70
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                   style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),  
                  SizedBox(height: 32,),
                 Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 30,),
                  child: TextFormField(
                    controller: codeinputcontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      hintText: 'Enter a join code',
                      hintStyle: TextStyle(
                        color: Colors.white70
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                   style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),  

                SizedBox(height: 30,),

                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(139, 5, 180, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("Join", style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),

                 SizedBox(height: 10,),
                 Text("or",style: TextStyle(fontSize: 18,color: Colors.white),),
                 SizedBox(height: 10,),

                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(139, 5, 180, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("Practice Quiz", style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ],
            ),

          ),
        ),

      ),
    );
  }
}