class Todo {
  String id;
  String data;
  bool isComplete;
  String userId;
  Todo({
    required this.id,
    required this.data,
    required this.userId,
    this.isComplete = false,
  });
}
