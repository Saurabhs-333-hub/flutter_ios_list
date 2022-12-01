// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  final String id;
  const Users({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    return FutureBuilder(
      future: user.doc(id).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
              '${data['firstname']} ${data['lastname']} ${data['email']}',
              style: TextStyle(color: Colors.white));
        }
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            color: Color.fromARGB(255, 225, 0, 255),
          ),
        );
      },
    );
  }
}
