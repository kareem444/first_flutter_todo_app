import 'package:flutter/material.dart';

class TodoCounter extends StatelessWidget {
  final int allCount;
  final int checkedCount;

  const TodoCounter({
    Key? key,
    required this.allCount,
    required this.checkedCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "$checkedCount/$allCount",
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: checkedCount == allCount ? Colors.green : Colors.black87),
        ),
      ),
    );
  }
}
