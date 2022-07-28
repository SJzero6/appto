import 'package:appto/models/todo.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todolist = [];

  List<Todo> get todolist => _todolist;

  void addtodo(String title) {
    String id =
        "${_todolist.length.toString()}${DateTime.now().millisecondsSinceEpoch}";

    _todolist.add(Todo(id: id, data: title));
    notifyListeners();
  }

  void removeTodo(String id) {
    _todolist.removeWhere((todo) => todo.id == id);

    notifyListeners();
  }

  void completeTodo(String id) {
    Todo currentTodo = _todolist.singleWhere((element) => element.id == id);

    currentTodo.isComplete = !currentTodo.isComplete;

    notifyListeners();
  }

  //Search query
  String _searchQuery = "";

  String get searchQuery => _searchQuery;

  //Search results
  List<Todo> _searchResults = [];

  List<Todo> get searchResults => _searchResults;

  searchTodos(String query) {
    _searchQuery = query;
    _searchResults.clear();
    _searchResults =
        _todolist.where((element) => element.data.contains(query)).toList();

    notifyListeners();
  }

  clearSearch() {
    _searchQuery = "";
    _searchResults.clear();

    notifyListeners();
  }
}
