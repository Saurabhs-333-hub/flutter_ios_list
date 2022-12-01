// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final VoidCallback login;
  const Register({super.key, required this.login});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _cpassword = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    _fname.dispose();
    _lname.dispose();
    _cpassword.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      showBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(67, 165, 105, 255),
                  borderRadius: BorderRadius.circular(60),
                  backgroundBlendMode: BlendMode.color,
                ),
                height: 100,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    color: Color.fromARGB(255, 225, 0, 255),
                  ),
                ),
              ),
            );
          });
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim());
      }
      addUser(
        _fname.text.trim(),
        _lname.text.trim(),
        _email.text.trim(),
      );
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  Future addUser(
    String firstname,
    String lastname,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection("users").add({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_password.text.trim() == _cpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 26, 46),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.app_registration_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Text("Hello Again!",
                    //     style: GoogleFonts.bebasNeue(
                    //         fontSize: 36,
                    //         color: Color.fromARGB(255, 255, 255, 255))),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(198, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 43, 41, 86)),
                      child: TextField(
                        controller: _fname,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: "First Name",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 16)),
                            hintText: "First Name",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(198, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 43, 41, 86)),
                      child: TextField(
                        controller: _lname,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: "Last Name",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 16)),
                            hintText: "Last Name",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(198, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 43, 41, 86)),

                      child: TextField(
                        controller: _email,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 16)),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(198, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 43, 41, 86)),
                      child: TextField(
                        controller: _password,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 16)),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(198, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 43, 41, 86)),
                      child: TextField(
                        controller: _cpassword,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 16)),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: signUp,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(161, 37, 37, 104),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text("Sign Up",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color:
                                        Color.fromARGB(255, 255, 255, 255)))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an Account? ",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255))),
                        GestureDetector(
                          onTap: widget.login,
                          child: Text("Login Now!",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 0, 140, 255))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
    // );
  }
}
