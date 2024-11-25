import 'package:flutter/material.dart';
import 'package:quizsutra/ui/quizcode.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}



class _LeaderboardState extends State<Leaderboard> {
   List<Map<String, dynamic>> leaderboardData = [
    {"username": "alok", "score": 1},
    
  ];

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Leaderboard",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        backgroundColor: const Color.fromARGB(255, 130, 36, 147),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child: Text("Top Scorers",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white,),)),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                
                shrinkWrap: true,
                itemCount: leaderboardData.length,
                itemBuilder: (context, index){
                  var player = leaderboardData[index];
                  
              
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      color: Colors.black38,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text("${(index+1).toString()}", style: TextStyle(color: Colors.purple),),
                        ),
                        title: Text(player["username"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                  
                        trailing: Text("${player["score"]}",style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                      ),
                    
                       
                    ),
                  );
              
                }
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Quizcode()));
            },
            child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
              ),
              
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text("Home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),),
              )
            ),
            
          ),
          SizedBox(height:30,)
          

        ],
      ),
    );
  }
}
