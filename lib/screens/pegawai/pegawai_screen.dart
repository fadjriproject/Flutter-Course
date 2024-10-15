import 'package:flutter/material.dart';
import 'package:klinik_app/models/pegawai.dart';
import 'package:klinik_app/theme/config.dart';
import 'package:klinik_app/widgets/pegawai/pegawai_card.dart';

class PegawaiScreen extends StatefulWidget {
  const PegawaiScreen({super.key});

  @override
  State<PegawaiScreen> createState() => _PegawaiScreenState();
}

class _PegawaiScreenState extends State<PegawaiScreen> {
  final List<Pegawai> pegawai = [
    Pegawai(1, "202102-01", "Ardie", "10/01/1922", "gmail@ardie.com", "ardieajah"),
    Pegawai(2, "202002-02", "Nico", "10/01/1922", "gmail@nico.com", "niconiconi"),
    Pegawai(3, "202202-02", "Iqbil", "10/01/1922", "gmail@iqbil.com", "iqbilkun"),
    Pegawai(4, "202102-04", "Ibra", "10/01/1922", "gmail@ibra.com", "ibrahim"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.pegawaiPage),
      ),
      body: ListView(
        children: pegawai.map((pegawai) {
          return PegawaiCard(pegawai: pegawai);
        }).toList(),
      ),
    );
  }
}
