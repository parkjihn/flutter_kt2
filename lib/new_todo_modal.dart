import 'package:flutter/material.dart';

class NewTodoModal extends StatefulWidget {
  final Function addTodo;

  NewTodoModal(this.addTodo);

  @override
  _NewTodoModalState createState() => _NewTodoModalState();
}

class _NewTodoModalState extends State<NewTodoModal> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredText = _textController.text;

    if (enteredTitle.isEmpty || enteredText.isEmpty) {
      return;
    }

    widget.addTodo(
      enteredTitle,
      enteredText,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Text'),
              controller: _textController,
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Add Todo'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}