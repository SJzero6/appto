import 'package:appto/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseApis {
  static addTodo({required String data, required bool isComplete, required String userId}) async {
    String firebaseId = "";
    await FirebaseFirestore.instance.collection('todos').add({
      'data': data,
      'isComplete': isComplete,
      'userId' : userId,
    }).then((doc) {
      firebaseId = doc.id;
    });

    return firebaseId;
  }

  static Future<List<Todo>> loadTodos() async {
    List<Todo> todos = [];
    await FirebaseFirestore.instance
        .collection('todos')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((querysnapshot) {
      for (var element in querysnapshot.docs) {
        todos.add(Todo(
            id: element.id,
            data: element['data'],
            userId: element['userId'],
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
