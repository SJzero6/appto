import 'package:appto/models/todo.dart';
import 'package:appto/services/firebase_apis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todolist = [];

  List<Todo> get todolist => _todolist;

  void addtodo(String title) async {

    String uid = FirebaseAuth.instance.currentUser!.uid;

    String id = await FirebaseApis.addTodo(data: title, isComplete: false, userId: uid);

    _todolist.add(Todo(id: id, data: title, isComplete: false, userId: uid));
    notifyListeners();
  }

  void removeTodo(String id) async {
    await FirebaseApis.deleteTodo(id);
    _todolist.removeWhere((todo) => todo.id == id);

    notifyListeners();
  }

  void completeTodo(String id) async {
    Todo currentTodo = _todolist.singleWhere((element) => element.id == id);

    currentTodo.isComplete = !currentTodo.isComplete;

    await FirebaseApis.changeIscompleteTodo(
        id: id, isComplete: currentTodo.isComplete);

    notifyListeners();
  }

  void updateTodo(String id, String updatedData) async {
    await FirebaseApis.updateTodo(id: id, data: updatedData);
    Todo upTodo = _todolist.singleWhere((element) => element.id == id);
    upTodo.data = updatedData;

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

  //id of todo that is being edited
  String? _editingTodoId;

  String? get editingTodoId => _editingTodoId;

  set editingTodoId(String? id) {
    _editingTodoId = id;

    notifyListeners();
  }

  clearEditingTodoId() {
    _editingTodoId = null;

    notifyListeners();
  }

  loadTodos() async {
    _todolist = await FirebaseApis.loadTodos();

    notifyListeners();
  }
}
