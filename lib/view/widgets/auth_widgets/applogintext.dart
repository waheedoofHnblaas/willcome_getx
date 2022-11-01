import 'package:flutter/material.dart';

class AppLoginTitel extends StatelessWidget {
  const AppLoginTitel({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
