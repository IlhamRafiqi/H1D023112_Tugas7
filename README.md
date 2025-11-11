# Aplikasi Input Data Mahasiswa

Aplikasi Flutter untuk input data mahasiswa (Nama, NIM, Tahun Lahir) dan menampilkannya di halaman baru.

## Struktur Proyek

```
lib/
├── main.dart              # Entry point aplikasi
└── ui/
    ├── form_data.dart     # Halaman form input
    └── tampil_data.dart   # Halaman tampilan data
```

## Cara Kerja Passing Data

### 1️⃣ Input Data (form_data.dart)

Data diambil dari form menggunakan `TextEditingController`:

```dart
final _namaController = TextEditingController();
final _nimController = TextEditingController();
final _tahunLahirController = TextEditingController();
```

### 2️⃣ Kirim Data

Saat tombol "Simpan" ditekan, data dikirim ke halaman `TampilData`:

```dart
// Ambil data dari controller
String nama = _namaController.text;
String nim = _nimController.text;
String tahunLahir = _tahunLahirController.text;

// Kirim ke halaman TampilData
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => TampilData(
      nama: nama,
      nim: nim,
      tahunLahir: tahunLahir,
    ),
  ),
);
```

### 3️⃣ Terima Data (tampil_data.dart)

Halaman `TampilData` menerima data melalui constructor:

```dart
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final String tahunLahir;

  const TampilData({
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  });
```

### 4️⃣ Gunakan Data

Data yang diterima bisa langsung digunakan:

```dart
Text('Nama saya $nama, NIM $nim')

// Atau untuk perhitungan
int umur = DateTime.now().year - int.parse(tahunLahir);
```

## Diagram Alur

```
FormData (Input) 
    ↓
Validasi Form
    ↓
Ambil Data dari Controller
    ↓
Navigator.push + Kirim Data
    ↓
TampilData (Terima melalui constructor)
    ↓
Tampilkan Data di UI
```

## Kenapa Pakai Constructor?

✅ **Mudah dipahami**  
✅ **Type-safe** (tipe data jelas)  
✅ **Cocok untuk data sederhana**  
✅ **Best practice untuk StatelessWidget**

## Cara Menjalankan

```bash
flutter pub get
flutter run
```

---

**Catatan:** Passing data dengan constructor cocok untuk aplikasi sederhana. Untuk aplikasi kompleks, gunakan state management (Provider, Bloc, dll).
