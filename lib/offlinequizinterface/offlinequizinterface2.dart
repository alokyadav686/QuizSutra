import 'package:flutter/material.dart';
import 'package:quizsutra/quizscreen/quizscreen2.dart';

class Offlinequizinterface2 extends StatefulWidget {
  const Offlinequizinterface2({super.key});

  @override
  State<Offlinequizinterface2> createState() => _Offlinequizinterface2State();
}

class _Offlinequizinterface2State extends State<Offlinequizinterface2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aptitude Quiz', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/aptitude.jpg',
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
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Relatedto("Number Series"),                  
                          SizedBox(width: 5,),                  
                          Relatedto("Percentage"),
                          
                  
                        ],
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
                      "The Aptitude Quiz evaluates logical reasoning, mathematical skills, and problem-solving. It covers topics like mathematics, data interpretation, and verbal reasoning, helping you prepare for competitive exams and improve critical thinking.",
                      style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 54, 54, 54)),
                    ),
                  ],
                ),
              ),

              
              SizedBox(height: 40),

                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Quizscreen2()));
                    
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
