void cekUmur(int umur) {
  // Jika umur di bawah 17, lempar error "Belum cukup umur"
  if (umur < 17) {
  throw 'belum cukup umur';
  // Kalau aman, print "Selamat, kamu bisa bikin KTP"
  } else {
    print('Kamu bisa bikin KTP');
  }
}

void main() {
  try {
    cekUmur(18); // Ganti ke 18 untuk coba yang aman
  } catch (e) {
    print("Terjadi error: $e");
  } finally {
    print("Pengecekan umur selesai");
  }
}
