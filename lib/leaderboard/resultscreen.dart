import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final List<Map<String, String>> resultData;

  const ResultScreen({Key? key, required this.score, required this.resultData}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Your Score",style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),),

              SizedBox(height: 20),
              Text("${widget.score} / 300",style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),),
              
              SizedBox(height: 40),

              Expanded(
                child: ListView.builder(
                  itemCount: widget.resultData.length,
                  itemBuilder: (context, index) {
                    var result = widget.resultData[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${result["question"]}",style: TextStyle(fontSize: 16, color:Colors.white),),

                              SizedBox(height: 10),

                              Text("Your Answer: ${result["userAnswer"]}",style: TextStyle(fontSize: 16, color: result["userAnswer"]== result["correctAnswer"] ? Colors.green : Colors.red),),
                              
                              SizedBox(height: 5),
                              Text("Correct Answer: ${result["correctAnswer"]}",style: TextStyle(fontSize: 16, color: Colors.green),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Another Quiz",style: TextStyle(fontSize: 20, color: Colors.purple),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
