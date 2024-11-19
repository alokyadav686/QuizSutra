import 'package:flutter/material.dart';

class Practicequiz extends StatefulWidget {
  const Practicequiz({super.key});

  @override
  State<Practicequiz> createState() => _PracticequizState();
}

class _PracticequizState extends State<Practicequiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(top: 40),
                  child: Text("Khelega Quiz??",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
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
            
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                  ),
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