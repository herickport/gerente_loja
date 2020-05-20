import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final bool obscure;

  InputField({@required this.icon, @required this.hint, @required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent)
          ),
          contentPadding: EdgeInsets.only(
            left: 5,
            right: 15,
            bottom: 15,
            top: 15
          )
        ),
        style: TextStyle(color: Colors.white),
        obscureText: obscure,
      ),
    );
  }
}