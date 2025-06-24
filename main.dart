void main() {
  // 1. Bikin variabel bertipe String dengan nama 'game' dan isi "Mobile Legends"
  String game = "Mobile Legends";
  // 2. Bikin variabel umur kakak dan tinggi badan kakak
  int umur = 16;
  double tinggi = 171.8;
  // 3. Tampilkan semua ke layar pakai print
  print("Game kesukaan : $game");
  print("Umur saya : $umur");
  print("Tinggi saya : $tinggi\n");

  if (umur <= 17) {
    print("Umur kamu masih $umur, Kamu masih belum boleh membuat KTP");
  } else {
    print("Umur kamu sudah $umur, Kamu sudah boleh memuat KTP\n");
  }

  for (int i = 1; i < 5; i++) {
    print("level ke-$i");
  }

int nyawa = 3;
  while (nyawa > 0) {
    print("nyawa sisa $nyawa");
    nyawa--;
  }

int duit = 0;
  do {
    print("kerja.....");
    print("duit mu sekarang : $duit");
    duit += 100;
  } while (duit < 1000);
}
