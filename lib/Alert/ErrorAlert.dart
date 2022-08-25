import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  final String errMess;
  const ErrorAlert({Key? key, required this.errMess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      backgroundColor: Colors.red,
      title: const Text(
        "Error",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Text(
        errMess,
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
