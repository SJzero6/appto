import 'package:appto/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseApis {
  static addTodo(
      {required String id,
      required String data,
      required bool isComplete}) async {
    FirebaseFirestore.instance.collection('todos').add({
      'id': id,
      'data': data,
      'isComplete': isComplete,
    });
  }

  static Future<List<Todo>> loadTodos() async {
    List<Todo> todos = [];
    await FirebaseFirestore.instance
        .collection('todos')
        .get()
        .then((querysnapshot) {
      for (var element in querysnapshot.docs) {
        element.id
        todos.add(Todo(
            id: element['id'],
            data: element['data'],
            isComplete: element['isComplete']));
      }
    });

    return todos;
  }
}
