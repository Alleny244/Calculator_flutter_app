import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final value;
  Function calculate;

  Buttons(this.value, this.calculate);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.zero,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color(0xFF00FA9A),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.black),
            )),
          ),
          onPressed: () => calculate(value),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Lucida',
            ),
          ),
        ),
      ),
    );
  }
}
