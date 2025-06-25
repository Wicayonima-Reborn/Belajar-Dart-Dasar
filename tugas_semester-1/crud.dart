import 'dart:io';

void main(){
  final file = File('data.txt');

  if (!file.existsSync()) {
    file.createSync();
  }

  while(true) {
    print('\n TO-DO APP');
    print('1. Tambah TO-DO');
    print('2. Lihat semua TO-DO');
    print('3. Edit TO-DO');
    print('4. Hapus TO-DO');
    print('5. Keluar');
    stdout.write('pilih Menu [1-5]: ');
    var input = stdin.readLineSync();

    switch (input) {
      case '1':
        tambahTodo(file);
        break;
      case '2':
        lihatTodo(file);
        break;
      case '3':
        editTodo(file);
        break;
      case '4':
        hapusTodo(file);
      case '5':
          print('Bye!');
          exit(0);
      default :
        print('Masukkan angka yang benar!');
    }
  }
}


void tambahTodo(File file) {
  stdout.write('Masukan To-Do baru: ');
  String? todo = stdin.readLineSync();

  if (todo != null && todo.trim().isNotEmpty) {
    file.writeAsStringSync('$todo\n', mode: FileMode.append);
    print('To-Do ditambahkan!');
  } else {
    print('Tidak boleh kosong!');
  }
}

void lihatTodo(File file) {
  List<String> todos = file.readAsLinesSync();
  if (todos.isEmpty) {
    print('Belum ada To-Do.');
    return;
  }

  print('\n Daftar To-Do');
  for (var i = 0; i < todos.length; i++) {
    print('${i+1}. ${todos[i]}');
  }
}

void editTodo(File file) {
  List<String> todos = file.readAsLinesSync();
  if (todos.isEmpty) {
    print('Tidak ada data untuk diedit.');
    return;
  }
  
  lihatTodo(file);
  stdout.write('Masukkan Nomor To-Do yang ingin diedit: ');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '') ?? -1;

  if (index < 1 || index > todos.length) {
    print('Nomor tidak valid.');
    return;
  }

  stdout.write('Masukkan isi baru: ');
  String? baru = stdin.readLineSync();

  if (baru != null && baru.trim().isNotEmpty) {
    todos[index - 1] = baru;
    file.writeAsStringSync(todos.join('\n') + '\n');
    print('To-Do berhasil diupdate!');
  } else {
    print('Input Tidak boleh kosong!');
  }
}


void hapusTodo(File file) {
  List<String> todos = file.readAsLinesSync();
  if (todos.isEmpty) {
    print('Tidak ada data untuk diedit.');
    return;
  }

  lihatTodo(file);
  stdout.write('Masukkan nomor To-Do yang ingin dihapus: ');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '') ?? -1;

  if (index < 1 || index > todos.length) {
    print('Nomor tidak valid.');
    return;
  }

  String removed = todos.removeAt( index - 1);
  file.writeAsStringSync(todos.join('\n') + (todos.isNotEmpty ? '\n' : ''));
  print('"$removed" berhasil dihapus');
}