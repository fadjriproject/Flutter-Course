import 'package:flutter/material.dart';
import 'package:klinik_app/models/pasien.dart';
import 'package:klinik_app/screens/pasien/pasien_detail.dart';

class PasienCard extends StatefulWidget {
  final Function(int pasienId) onDelete;
  final Function(Pasien) onEdit;

  final Pasien pasien;

  const PasienCard({
    super.key,
    required this.pasien,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<PasienCard> createState() => _PasienCardState();
}

class _PasienCardState extends State<PasienCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            widget.pasien.nama?[0] ?? "A",
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        title: Text(
          widget.pasien.nama ?? "Tanpa Nama",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.pasien.penyakit ?? "Penyakit",
                style: const TextStyle(color: Color.fromARGB(255, 59, 59, 59))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kontak: ${widget.pasien.noTelepon}",
                    style: const TextStyle(fontSize: 12)),
                Text("Ruang: ${widget.pasien.noRM}",
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                widget.onEdit(widget.pasien); // Call onEdit when tapped
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PasienDetail(
                      pasien: widget.pasien,
                      onDelete: (int id) {
                        widget.onDelete(id);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
