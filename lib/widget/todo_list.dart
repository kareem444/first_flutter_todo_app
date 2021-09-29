import 'package:flutter/material.dart';
import 'package:todo/models/todo_list.dart';
import 'package:todo/widget/todo_card.dart';

class TodoListView extends StatelessWidget {
  const TodoListView(
      {Key? key,
      required this.todos,
      required this.removeTodo,
      required this.editTodos})
      : super(key: key);

  final List<TodoList> todos;
  final Function removeTodo;
  final Function(int) editTodos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                removeTodo(i);
              },
              child: TodoCard(
                title: todos[i].title,
                compelete: todos[i].compelete,
                editTodo: editTodos,
                todoIndex: i,
              ));
          // return TodoCard(title: todos[i].title, compelete: todos[i].compelete);
        },
        itemCount: todos.length,
      ),
    );
  }
}
