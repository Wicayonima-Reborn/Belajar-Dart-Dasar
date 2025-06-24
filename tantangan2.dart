// 1. Fungsi tanpa parameter & tanpa return
void intro() {
  // Tulis print "Saya sedang belajar Dart"
  print('Saya sedang belajar Dart');
}

// 2. Fungsi dengan parameter (nama game)
void mainGame(String game) {
  // Tulis print "Saya suka main [nama game]"
  print('saya suka main $game');
}

// 3. Fungsi tambah angka dengan return
int tambah(int a, int b) {
  // Balikin hasil tambahnya
  return a + b;
}
void main() {
  intro();
  mainGame("Mobile Legends");

  int hasil = tambah(4, 7);
  print("Hasil tambah: $hasil");
}
