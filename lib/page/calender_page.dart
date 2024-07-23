import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '캘린더',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
