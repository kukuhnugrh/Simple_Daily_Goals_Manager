class DailyGoals {
  String? task;
  bool? isDone;
  String? createdAt;
  String? finishedAt;

  DailyGoals({
    this.task,
    this.isDone,
    this.createdAt,
    this.finishedAt
  });

  factory DailyGoals.fromJson(Map<String, dynamic> json) {
    return DailyGoals(
      task: json['task'],
      isDone: json['isDone'],
      createdAt: json['createdAt'],
      finishedAt: json['finishedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    'task': task,
    'isDone': isDone,
    'createdAt': createdAt,
    'finishedAt': finishedAt
  };
}