import 'package:flutter/material.dart';
import 'package:klinik_app/models/pegawai.dart';
import 'package:klinik_app/screens/pegawai/pegawai_form.dart';
import 'package:klinik_app/theme/config.dart';
import 'package:klinik_app/widgets/pegawai/pegawai_card.dart';

class PegawaiScreen extends StatefulWidget {
  const PegawaiScreen({super.key});

  @override
  State<PegawaiScreen> createState() => _PegawaiScreenState();
}

class _PegawaiScreenState extends State<PegawaiScreen> {
  final List<Pegawai> pegawai = [
    Pegawai(
        1, "202102-01", "Ardie", "10/01/1922", "gmail@ardie.com", "ardieajah"),
  ];

  void _showAddPegawaiBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return PegawaiForm(
            // onSubmit: (newPegawai) {
            //   setState(() {
            //     pegawai.add(newPegawai);
            //   });
            //   Navigator.of(context).pop(); // Close the bottom sheet after adding
            // },
            );
      },
    );
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPegawaiBottomSheet,
        tooltip: 'Add Pegawai',
        child: const Icon(Icons.add),
      ),
    );
  }
}
