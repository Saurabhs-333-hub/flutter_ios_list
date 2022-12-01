// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thoughts/pages/home_stories.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stories(),
    );
  }
}
