import 'package:flutter/material.dart';
import 'package:klinik_app/models/pegawai.dart';

class PegawaiDetail extends StatelessWidget {
  final Pegawai pegawai;

  const PegawaiDetail({
    super.key,
    required this.pegawai,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pegawai.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Pegawai',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              'NIP: ${pegawai.nip}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Nama: ${pegawai.nama}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${pegawai.email}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Tanggal Lahir: ${pegawai.tglLahir}',
              style: const TextStyle(fontSize: 16),
            ),
            // You can add more details here if needed
          ],
        ),
      ),
    );
  }
}
