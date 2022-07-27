import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _todolist = [];

  List<Map<String, dynamic>> get todolist => _todolist;
  void addtodo(String title) {
    _todolist.add({"title": title});
    notifyListeners();
  }
}
