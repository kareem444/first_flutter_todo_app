import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final bool compelete;
  final Function(int) editTodo;
  final int todoIndex;

  const TodoCard(
      {Key? key,
      required this.title,
      required this.compelete,
      required this.editTodo,
      required this.todoIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          editTodo(todoIndex);
        },
        child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Card(
              child: Container(
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      compelete ? Icons.check : Icons.close,
                      color: compelete ? Colors.green : Colors.red,
                    )
                  ],
                )),
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
              ),
            )));
  }
}
