import 'package:flutter/material.dart';
import 'package:quizsutra/quizscreen/quizscreen3.dart';

class Offlinequizinterface3 extends StatefulWidget {
  const Offlinequizinterface3({super.key});

  @override
  State<Offlinequizinterface3> createState() => _Offlinequizinterface3State();
}

class _Offlinequizinterface3State extends State<Offlinequizinterface3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reasoning Quiz', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/reasoning.jpeg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    // color: Colors.purple,
                    color: const Color.fromARGB(255, 243, 226, 246),
                    borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Related To -",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),),
                      
                      SizedBox(height: 10,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Relatedto("Analogy"),                  
                            SizedBox(width: 5,),                  
                            Relatedto("Critical Thinking"),
                            
                                          
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              
              
              SizedBox(height: 20),

               Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 226, 246),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    Icon(Icons.timer, color: Colors.purple, size: 22),
                    SizedBox(width: 10),
                    Text('30 mins', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.purple)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 226, 246),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About the Quiz",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),),
                    SizedBox(height: 10),
                    Text(
                      "The Logical Reasoning Quiz assesses your ability to think critically and solve problems using logic. It covers topics like patterns, analogies, puzzles, and deductive reasoning to enhance analytical thinking skills.",
                      style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 54, 54, 54)),
                    ),
                  ],
                ),
              ),

              
              SizedBox(height: 40),

                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Quizscreen3()));
                   
                    
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      gradient: LinearGradient(colors: 
                      [Colors.purple,Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 8, offset: Offset(0, 4))]
                  
                    ),
                    child: Center(child: Text("Start Quiz",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                ),
             
            ],
          ),
        ),
      ),
    );;
  }
}

Widget Relatedto(String relto) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 114, 20, 131),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
      ],
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        child: Text(
          relto,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    ),
  );
}
