import 'package:flutter/material.dart';
import 'package:klinik_app/models/pasien.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;
  final Function(int) onDelete; // Callback to handle delete action

  const PasienDetail({
    super.key,
    required this.pasien,
    required this.onDelete,
  });

  @override
  _PasienDetailState createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pasien.nama ?? "Detail Pasien"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 26,
              child: Text(
                widget.pasien.nama?[0] ?? "A",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Nama: ${widget.pasien.nama ?? "Tanpa Nama"}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Penyakit: ${widget.pasien.penyakit ?? "Tidak Diketahui"}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              "Tanggal Lahir: ${widget.pasien.tglLahir ?? "Tidak Diketahui"}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              "Kontak: ${widget.pasien.noTelepon ?? "Tidak Diketahui"}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              "Ruang: ${widget.pasien.noRM}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              "Alamat: ${widget.pasien.alamat ?? "Tidak Diketahui"}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    hapus();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Hapus"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void hapus() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Pasien"),
          content: const Text("Apakah Anda yakin ingin menghapus pasien ini?"),
          actions: [
            TextButton(
              onPressed: () {
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete(widget.pasien.id); // Assuming pasien has an id
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pasien dihapus!")),
                );
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to the previous screen
              },
              child: const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }
}
