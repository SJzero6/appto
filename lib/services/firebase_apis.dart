import 'package:appto/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseApis {
  static addTodo({required String data, required bool isComplete}) async {
    String firebaseId = "";
    await FirebaseFirestore.instance.collection('todos').add({
      'data': data,
      'isComplete': isComplete,
    }).then((doc) {
      firebaseId = doc.id;
    });

    return firebaseId;
  }

  static Future<List<Todo>> loadTodos() async {
    List<Todo> todos = [];
    await FirebaseFirestore.instance
        .collection('todos')
        .get()
        .then((querysnapshot) {
      for (var element in querysnapshot.docs) {
        todos.add(Todo(
            id: element.id,
            data: element['data'],
            isComplete: element['isComplete']));
      }
    });

    return todos;
  }

  static deleteTodo(String id) async {
    await FirebaseFirestore.instance.collection('todos').doc(id).delete();
  }

  static updateTodo({
    required String id,
    required String data,
  }) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(id)
        .update({'data': data});
  }

  static changeIscompleteTodo(
      {required String id, required bool isComplete}) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(id)
        .update({'isComplete': isComplete});
  }
}
