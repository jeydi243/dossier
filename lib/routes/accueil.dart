// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Container()),
      body: Container(
        color: Colors.white,
        child: Center(child: Text('Leka')),
      ),
    );
  }
}
