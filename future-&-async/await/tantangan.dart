// Fungsi Future yang pura-pura ambil data rank Mobile Legends
Future<String> getRank() async {
  // Kasih delay 2 detik
  await Future.delayed(Duration(seconds: 2));
  return "Mythic";
}

void main() async {
  print("Sedang login...");
  // Panggil getRank() dan simpan hasilnya di variabel rank
  String rank = await getRank();
  // Print hasilnya kayak: "Rank kamu adalah: Mythic"
  print('Rank kamu adalah $rank');
}
