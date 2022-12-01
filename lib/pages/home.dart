// import 'dart:html';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughts/data/data.dart';
import 'package:thoughts/pages/home_stories.dart';
import 'package:thoughts/pages/utils/addstories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!.email;
  List<String> id = [];
  Future getIds() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.id);
              id.add(element.reference.id);
            }));
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getIds();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 26, 46),
        appBar: AppBar(
          title: Text("$user"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            CupertinoButton(
              child: Text("Sign Out!"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // duration: Duration(seconds: 4),
            // transform: Matrix4.rotationZ(0),
            // curve: Curves.bounceIn,
            padding: EdgeInsets.all(8),
            // height: ,
            decoration: BoxDecoration(
                // color: Color.fromARGB(255, 43, 41, 86),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(child: Text(id.first)),
                Expanded(
                    child: FutureBuilder(
                        future: getIds(),
                        builder: (context, snapshots) {
                          return ListView.builder(
                              itemCount: id.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Users(id: id[index]),
                                    tileColor: Color.fromARGB(255, 43, 41, 86),
                                    selected: false,
                                    leading: Icon(Icons.person_outline_outlined,
                                        color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(
                                          8), //<-- SEE HERE
                                    ),
                                  ),
                                );
                              });
                        })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("S T O R I E S",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 0, 140, 255))),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context) {
                                return Stories();
                              },
                            ));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context) {
                                return AddStories();
                              },
                            ));
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ))));
  }
}
