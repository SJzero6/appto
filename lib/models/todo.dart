class Todo {
  String id;
  String data;
  bool isComplete;
  Todo({
    required this.id,
    required this.data,
    this.isComplete = false,
  });
}
