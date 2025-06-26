// File: services/todo_service.dart
import 'package:todo_app_modular/db/db_helper.dart';
import 'package:todo_app_modular/models/todo_item.dart';

class TodoService {
  final DBHelper _dbHelper = DBHelper();

  Future<void> init() async {
    await _dbHelper.database;
  }

  Future<void> addTodo(String title, String category) async {
    final db = await _dbHelper.database;
    final todo = TodoItem(title: title, category: category);
    await db.insert('todos', todo.toMap());
    print('✅ To-do berhasil ditambahkan!');
  }

  Future<void> displayTodos() async {
    final db = await _dbHelper.database;
    final List<Map<String, Object?>> maps = await db.query('todos');

    if (maps.isEmpty) {
      print('📭 Belum ada to-do.');
    } else {
      print('\n📋 Daftar To-do:');
      for (var map in maps) {
        final todo = TodoItem.fromMap(map);
        final status = todo.isDone ? "[x]" : "[ ]";
        print('${todo.id}. $status ${todo.title} (Kategori: ${todo.category}, Dibuat: ${todo.createdAt.toLocal()})');
      }
    }
  }

  Future<void> updateTodo(int id, String title, bool isDone, String category) async {
    final db = await _dbHelper.database;
    final todo = TodoItem(
      id: id,
      title: title,
      isDone: isDone,
      category: category,
      createdAt: DateTime.now(),
    );
    await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    print('✏️ To-do berhasil diupdate.');
  }

  Future<void> deleteTodo(int id) async {
    final db = await _dbHelper.database;
    await db.delete('todos', where: 'id = ?', whereArgs: [id]);
    print('🗑️ To-do berhasil dihapus.');
  }

  Future<void> searchTodo(String keyword) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      where: 'title LIKE ?',
      whereArgs: ['%$keyword%'],
    );

    if (maps.isEmpty) {
      print('🔍 Tidak ditemukan todo dengan kata: $keyword');
    } else {
      print('\n🔍 Hasil pencarian:');
      for (var map in maps) {
        final todo = TodoItem.fromMap(map);
        final status = todo.isDone ? "[x]" : "[ ]";
        print('${todo.id}. $status ${todo.title} (Kategori: ${todo.category})');
      }
    }
  }
}
