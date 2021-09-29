import 'package:flutter/material.dart';
import 'package:todo/models/todo_list.dart';
import 'package:todo/widget/counter.dart';
import 'package:todo/widget/new_todo.dart';
import 'package:todo/widget/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TodoList> todos = [
    TodoList(id: 1, title: "this is todo number 1", compelete: true),
    TodoList(id: 1, title: "this is todo number 2", compelete: true),
    TodoList(id: 1, title: "this is todo number 3", compelete: true),
  ];

  void _addTodo(String todo) {
    if (todo.isNotEmpty) {
      setState(() {
        todos.insert(
            0, TodoList(id: todos.length, title: todo, compelete: false));
      });
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _editTodos(int index) {
    setState(() {
      todos[index].compelete = !todos[index].compelete;
    });
  }

  int checkedTodos() {
    int numberOfChecked = 0;

    for (int i = 0; i < todos.length; i++) {
      if (todos[i].compelete) {
        numberOfChecked++;
      }
    }
    return numberOfChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: todos.length > 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TodoCounter(
                    allCount: todos.length,
                    checkedCount: checkedTodos(),
                  ),
                  TodoListView(
                    todos: todos,
                    removeTodo: removeTodo,
                    editTodos: _editTodos,
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "No thing to do today",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (bcTx) {
                return NewTodo(addTodo: _addTodo);
              },
              isScrollControlled: true);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
