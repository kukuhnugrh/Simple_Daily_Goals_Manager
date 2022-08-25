import 'package:flutter/material.dart';

class WarningAlert extends StatelessWidget {
  final String warnMess;
  const WarningAlert({Key? key, required this.warnMess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      backgroundColor: Colors.yellow,
      title: const Text(
        "Warning",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Text(
        warnMess,
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
