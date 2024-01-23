import 'package:flutter/material.dart';

class AddNewContrat extends StatefulWidget {
  const AddNewContrat({super.key});

  @override
  State<AddNewContrat> createState() => _AddNewContratState();
}

class _AddNewContratState extends State<AddNewContrat> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            )
          ],
        )));
  }
}
