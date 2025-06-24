// void main() {
// List<String>hero = ['layla', 'minion', 'ronaldo'];
// print(hero);
// hero.add('zilong');
// print(hero);
// }

void main() {
  // 1. Bikin List berisi 3 hero Mobile Legends
  List<String> hero = ['layla', 'miya', 'fanny']; // isi di sini

  // Print semua hero pakai loop
  for (String nama in hero) {
    print("Hero favorit: $nama");
  }

  // 2. Bikin Map berisi data player: nama, rank, dan skinLegendary (bool)
  Map<String, dynamic> player = {
    'nama' : 'cool',
    'rank' : 'imo',
    'skinLegendary' : true 
  };
print("Nama : ${player['nama']}, Rank : ${player['rank']}, skin? : ${player['skinLegendary']}");
  // Print: "Nama: Kakak, Rank: Mythic, Skin Legendary: true"
}
