import 'dart:io';

void main() {
  Map<String, int> dataMahasiswa = {};

  // nilai  5 mahasiswa
  for (int i = 1; i <= 5; i++) {
    stdout.write('Masukkan nama mahasiswa ke-$i: ');
    String? nama = stdin.readLineSync();

    stdout.write('Masukkan nilai ujian $nama: ');
    int? nilai = int.tryParse(stdin.readLineSync() ?? '0');

    if (nama != null && nilai != null) {
      dataMahasiswa[nama] = nilai;
    } else {
      print('Input tidak valid. Coba lagi.');
      i--; //iterasi
    }
  }

  print('\n=== HASIL KELULUSAN MAHASISWA ===');

  // kategori 
  dataMahasiswa.forEach((nama, nilai) {
    String kategori;

    if (nilai >= 80) {
      kategori = 'A';
    } else if (nilai >= 60) {
      kategori = 'B';
    } else {
      kategori = 'C';
    }

    // menampilkan hasil dari input nilai
    print('Mahasiswa: $nama | Nilai: $nilai | Kategori: $kategori');
  });
}
