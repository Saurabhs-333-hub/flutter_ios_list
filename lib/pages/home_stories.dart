// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughts/pages/utils/Card.dart';
import 'package:thoughts/pages/utils/story.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  void _openStory() {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return StoryPage();
    }));
  }

  List<String> id = [];
  Future getIds() async {
    await FirebaseFirestore.instance
        .collection('stories')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.id);
              id.add(element.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text("S T O R I E S"),
          backgroundColor: Color.fromARGB(255, 26, 26, 46)),
      backgroundColor: Color.fromARGB(255, 26, 26, 46),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getIds(),
                builder: (context, snapshot) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: id.length,
                      itemBuilder: (context, index) {
                        return Cards(
                          function: _openStory,
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
