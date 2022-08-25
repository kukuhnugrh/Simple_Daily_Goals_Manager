import 'package:flutter/material.dart';

class SuccessAlert extends StatelessWidget {
  final String succMess;
  const SuccessAlert({Key? key, required this.succMess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      backgroundColor: Colors.green,
      title: const Text(
        "Success",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Text(
        succMess,
        style: const TextStyle(
            fontWeight: FontWeight.bold
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[800], // background
            onPrimary: Colors.white,
            fixedSize: const Size.fromWidth(100),
            alignment: Alignment.center,
          ),
          child: const Text(
            'Ok',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
        )
      ],
    );
  }
}
