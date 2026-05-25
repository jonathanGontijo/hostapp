import 'package:flutter/material.dart';

class MyPostingsPage extends StatefulWidget {
  const MyPostingsPage({super.key});

  @override
  State<MyPostingsPage> createState() => _MyPostingsPageState();
}

class _MyPostingsPageState extends State<MyPostingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('My Postings Page'),
      ),
    );
  }
}