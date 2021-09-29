import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key? key, required this.addTodo}) : super(key: key);
  final Function(String) addTodo;
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(20),
          child: TextField(
            controller: todoController,
            decoration: const InputDecoration(labelText: "New Todo"),
            maxLength: 15,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel",
                    style: TextStyle(color: Colors.redAccent, fontSize: 20))),
            TextButton(
                onPressed: () {
                  widget.addTodo(todoController.text);
                },
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        )
      ],
    );
  }
}
