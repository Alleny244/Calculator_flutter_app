import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final result;
  Answer(this.result);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(50),
      child: result != null
          ? Text(
              result.toString(),
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(0, 250, 154, 1),
              ),
              textAlign: TextAlign.center,
            )
          : Text(
              "0",
              style: TextStyle(
                color: Color.fromRGBO(0, 250, 154, 1),
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
