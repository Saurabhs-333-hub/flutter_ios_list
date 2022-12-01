// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughts/pages/home_stories.dart';
import 'package:thoughts/pages/utils/story.dart';

class AddStories extends StatefulWidget {
  const AddStories({super.key});

  @override
  State<AddStories> createState() => _AddStoriesState();
}

class _AddStoriesState extends State<AddStories> {
  final _uploadStory = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _uploadStory.dispose();
    super.dispose();
  }

  Future upload() async {
    try {
      scaffoldKey.currentState!
          .showBottomSheet(backgroundColor: Colors.transparent, (context) {
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
      await FirebaseFirestore.instance.collection("stories").add({
        'story': _uploadStory.text.trim(),
      });
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return Stories();
    }));
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CupertinoNavigationBar(
        middle: Text("Post Your Story",
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 26, 26, 46),
      ),
      backgroundColor: Color.fromARGB(255, 26, 26, 46),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Add Your Thought....",
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: TextField(
                      controller: _uploadStory,
                      cursorColor: Color.fromARGB(255, 52, 52, 93),
                      maxLines: 10,
                      decoration: InputDecoration(
                        // icon: Icon(Icons.home),
                        // fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(),
                        ),
                      )),
                ),
              ),
              CupertinoButton(
                  child: Text("Upload Story"),
                  onPressed: () {
                    upload();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
