// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:appto/models/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
                    value: todo.isComplete,
                    onChanged: (_) => completeTodo(),
                  ),
                ),
                Expanded(
                  child: Text(todo.data,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: todo.isComplete
                              ? TextDecoration.lineThrough
                              : null)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 18,
                    icon: Icon(Icons.delete),
                    onPressed: deleteTodo,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
