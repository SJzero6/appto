// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:appto/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.data, this.isComplete = false})
      : super(key: key);
  final String data;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
            isComplete ? Icons.check_box : Icons.check_box_outline_blank,
            color: Color.fromARGB(255, 9, 82, 240)),
        title: Text(data,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: isComplete ? TextDecoration.lineThrough : null)),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
