import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Waitingroom extends StatefulWidget {
  const Waitingroom({super.key});

  @override
  State<Waitingroom> createState() => _WaitingroomState();
}

class _WaitingroomState extends State<Waitingroom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Colors.purple,
      
       body: Padding(
         padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 40),
         child: Container(
          width: double.infinity,
          height: double.infinity,
          // color: Colors.amber,
           child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Quiz Code", style: TextStyle(fontSize: 38,fontWeight: FontWeight.w600,color: Colors.white),),
                  
                  SizedBox(height: 50,),
                  Text("Waiting for admin to start....", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),
                  SizedBox(height: 40,),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  )

                ],
           ),
         ),
       ),
      
      ),
    );
  }
}