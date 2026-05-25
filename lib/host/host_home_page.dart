import 'package:flutter/material.dart';

class HostHomePage extends StatefulWidget {
  static const String routeName = '/hostHomePageRoute';

  const HostHomePage({super.key});

  @override
  State<HostHomePage> createState() => _HostHomePageState();
}

class _HostHomePageState extends State<HostHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Host Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Host Home Page'),
      ),
    );
  }
}