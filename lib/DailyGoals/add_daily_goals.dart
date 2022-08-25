import 'package:flutter/material.dart';

class AddDailyGoalsForm extends StatefulWidget {
  const AddDailyGoalsForm({Key? key}) : super(key: key);

  @override
  State<AddDailyGoalsForm> createState() => _AddDailyGoalsFormState();
}

class _AddDailyGoalsFormState extends State<AddDailyGoalsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: ()  {
            Navigator.pop(context);
          },
        ),
        title: const Text("Add Daily Goals"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.task),
                  hintText: "target hari ini . . .",
                  labelText: "Target",
                  focusColor: Colors.black,
                ),
                validator: (String? value) {
                  return (value == null) ? 'target tidak boleh kosong!' : null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
