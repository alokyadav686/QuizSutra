import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:quizsutra/livequizinterface/mainquiz.dart';
import 'package:quizsutra/ui/practicequiz.dart';

class Quizcode extends StatefulWidget {
  const Quizcode({super.key});

  @override
  State<Quizcode> createState() => _QuizcodeState();
}

class _QuizcodeState extends State<Quizcode> {
  final usernamecontroller = TextEditingController();
  final codeinputcontroller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 60),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.65),
                borderRadius: BorderRadius.circular(50),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 100, bottom: 50),
                      child: Text(
                        "QuizSutra",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        "Join using code",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          hintText: 'Username',
                          hintStyle: const TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: codeinputcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          hintText: 'Enter a join code',
                          hintStyle: const TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 30),
                    isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : InkWell(
                            onTap: () {
                              PostingUser();
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(139, 5, 180, 1),
                                    Color.fromRGBO(142, 45, 226, 1)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Center(
                                child: Text(
                                  "Join",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 20),
                    const Text("or", style: TextStyle(fontSize: 18, color: Colors.white)),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Practicequiz()));
                      },
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(139, 5, 180, 1),
                              Color.fromRGBO(142, 45, 226, 1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            "Practice Quiz",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void PostingUser() async {
    setState(() {
      isLoading = true;
    });

    var link4 = "https://quizapp-r80t.onrender.com/QuizEntry/enter";

    var data = {
      "username": usernamecontroller.text,
      "quizId": codeinputcontroller.text,
    };

    var bodyy = jsonEncode(data);
    var liveQuizz = Uri.parse(link4);

    try {
      Response response = await http.post(
        liveQuizz,
        body: bodyy,
        headers: {
          "Content-Type": "application/json",
        },
      );

      var dataa = jsonDecode(response.body);
      print(dataa);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Mainquiz(username: usernamecontroller.text, apiresponse: dataa),
        ),
      );
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
