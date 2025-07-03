import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  CustomTab(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    BorderSide borderSide = BorderSide(
      color: Color(0xFFF0F3F4),
    );
    return Tab(
      child: Container(
          child: Center(
            child: Text(text),
          ),
          decoration: BoxDecoration(
            border: Border(
              top: borderSide,
              left: borderSide,
            ),
          )),
    );
  }
}
