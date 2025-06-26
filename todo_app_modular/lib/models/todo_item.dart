class TodoItem {
  final int? id;
  final String title;
  final bool isDone;
  final String category;
  final DateTime createdAt;

  TodoItem({
    this.id,
    required this.title,
    this.isDone = false,
    this.category = 'Umum',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'] == 1,
      category: map['category'] ?? 'Umum',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
