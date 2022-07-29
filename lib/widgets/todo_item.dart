// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:appto/models/todo.dart';
import 'package:appto/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(
      {Key? key,
      required this.todo,
      required this.deleteTodo,
      required this.completeTodo})
      : super(key: key);
  final Todo todo;
  final VoidCallback deleteTodo;
  final VoidCallback completeTodo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isEditing = false;
  final TextEditingController _editTodoController =
      TextEditingController(text: "");

  _handleEdit() {
    TodoProvider todoProvider =
        Provider.of<TodoProvider>(context, listen: false);
    todoProvider.editingTodoId = widget.todo.id;
    _editTodoController.text = widget.todo.data;
  }

  _handleSaveTodo() {
    TodoProvider todoProvider =
        Provider.of<TodoProvider>(context, listen: false);
    if (_editTodoController.text.isEmpty) {
      todoProvider.clearEditingTodoId();

      return;
    }

    todoProvider.updateTodo(widget.todo.id, _editTodoController.text);

    todoProvider.clearEditingTodoId();
  }

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);

    isEditing = todoProvider.editingTodoId == widget.todo.id;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onLongPress: _handleEdit,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Checkbox(
                      value: widget.todo.isComplete,
                      onChanged:
                          isEditing ? null : (_) => widget.completeTodo(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: isEditing
                          ? TextField(
                              controller: _editTodoController,
                              autofocus: true,
                            )
                          : Text(widget.todo.data,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: widget.todo.isComplete
                                      ? TextDecoration.lineThrough
                                      : null)),
                    ),
                  ),
                  isEditing
                      ? Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: IconButton(
                            color: Colors.white,
                            iconSize: 18,
                            icon: Icon(Icons.save),
                            onPressed: _handleSaveTodo,
                          ),
                        )
                      : Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                color: Colors.white,
                                iconSize: 18,
                                icon: Icon(Icons.edit),
                                onPressed: _handleEdit,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 20),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                color: Colors.white,
                                iconSize: 18,
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.delete),
                                onPressed: widget.deleteTodo,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            )),
      ),
    );
  }
}
