// File: main.dart
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_app_modular/services/todo_service.dart';


void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final todoService = TodoService();
  await todoService.init();

  while (true) {
    print('\n=== TO-DO APP ===');
    print('1. Tampilkan semua to-do');
    print('2. Tambah to-do');
    print('3. Update to-do');
    print('4. Hapus to-do');
    print('5. Keluar');
    print('6. Cari to-do');

    stdout.write('Pilih: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await todoService.displayTodos();
        break;
      case '2':
        stdout.write('Judul to-do: ');
        String? title = stdin.readLineSync();

        stdout.write('Kategori: ');
        String? category = stdin.readLineSync();

        if (title != null && category != null) {
        await todoService.addTodo(title, category);
        } else {
        print('❌ Input tidak valid!');
        }
        break;

      case '3':
        stdout.write('ID yang ingin diupdate: ');
        int? id = int.tryParse(stdin.readLineSync() ?? '');

        stdout.write('Judul baru: ');
        String? newTitle = stdin.readLineSync();

        stdout.write('Status selesai? (y/n): ');
        String? statusInput = stdin.readLineSync();
        bool isDone = statusInput?.toLowerCase() == 'y';

        stdout.write('Kategori baru: ');
        String? category = stdin.readLineSync();

        if (id != null && newTitle != null && category != null) {
          await todoService.updateTodo(id, newTitle, isDone, category);
        } else {
          print('❌ Input tidak valid!');
        }
        break;
      case '4':
        stdout.write('ID yang mau dihapus: ');
        int id = int.parse(stdin.readLineSync()!);
        await todoService.deleteTodo(id);
        break;
      case '5':
        print('Bye bye 👋');
        exit(0);
  case '6':
  stdout.write('Masukkan keyword: ');
  String? keyword = stdin.readLineSync();
  if (keyword != null) {
    await todoService.searchTodo(keyword);
  }
  break;

    }
  }
}
