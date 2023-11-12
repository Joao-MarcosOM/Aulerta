import 'package:aulerta_final/pages/task/ui/theme.dart';
import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  final String label;
  final Function() onTap;
  const MyButtom({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 5, top: 10),
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
