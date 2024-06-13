import 'package:flutter/material.dart';
import 'dart:math';
import 'todo.dart';
import 'new_todo_modal.dart'; 

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> _todos = [];

  void _addTodo(String title, String text) {
    final newTodo = Todo(
      id: Random().nextDouble().toString(),
      title: title,
      text: text,
    );

    setState(() {
      _todos.add(newTodo);
    });
  }

  void _startAddNewTodoModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTodoModal(_addTodo),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTodoModal(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text(_todos[index].title),
              subtitle: Text(_todos[index].text),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTodoModal(context),
      ),
    );
  }
}