import 'package:flutter/material.dart';
import 'package:quizsutra/ui/quizcode.dart';

class Practicequiz extends StatefulWidget {
  const Practicequiz({super.key});

  @override
  State<Practicequiz> createState() => _PracticequizState();
}

class _PracticequizState extends State<Practicequiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text("Khelega Quiz??",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.purple,
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
              // color: Colors.amber,
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
                      Text("Mr Alok Yadav",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white),),
                      Text("App Developer",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: Colors.white70),),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Leaderboard - 10th rank",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
            ),
            
            SizedBox(height: 25,),

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
                        child: Icon(Icons.quiz_sharp,color: Colors.white,)),
                      Text("Daily Quiz",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Quizcode()));
                  
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
                        child: Icon(Icons.qr_code_2_rounded,color: Colors.white,)),
                      Text("Join with code",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(height: 50,),
             
            
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
          color: Colors.purple,

        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                ),
                SizedBox(
                height: 20,
              ),

                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                  ),
                ),
            
                SizedBox(
                  height: 10,
                ),

                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white54
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white54
                      ),
                    ),
                  ],
                ),
                SizedBox(
                height: 20,
              ),
            
                InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                    ),
                  ),
                ),
            
                SizedBox(
                  height: 20,
                ),
            
                InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                    ),
                  ),
                ),
            
                SizedBox(
                  height: 20,
                ),
                
                InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                height: 20,
              ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}