List<Todo> todoFromJson(dynamic data) =>
    List<Todo>.from(data.map((x) => Todo.fromJson(x)));

class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );
}
