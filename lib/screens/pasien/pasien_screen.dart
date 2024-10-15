import 'package:flutter/material.dart';
import 'package:klinik_app/models/pasien.dart';
import 'package:klinik_app/screens/pasien/pasien_form.dart';
import 'package:klinik_app/theme/config.dart';
import 'package:klinik_app/widgets/pasien/pasien_card.dart';

class PasienScreen extends StatefulWidget {
  const PasienScreen({super.key});

  @override
  State<PasienScreen> createState() => _PasienScreenState();
}

class _PasienScreenState extends State<PasienScreen> {
  final List<Pasien> pasiens = [
    Pasien(1, "CEMPAKA", "DOLAY", "Sembelit", "1999/09/10", "085848",
        "Rawa Belong")
  ];

  void _showAddPasienBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return PasienForm(
          onAddPasien: (Pasien newPasien) {
            setState(() {
              pasiens.add(newPasien);
            });
          },
        );
      },
    );
  }

  void _showEditPasienBottomSheet(Pasien pasien) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return PasienForm(
          onAddPasien: (Pasien updatedPasien) {
            setState(() {
              // Update the existing pasien in the list
              final index = pasiens.indexWhere((p) => p.id == pasien.id);
              if (index != -1) {
                pasiens[index] = updatedPasien;
              }
            });
          },
          pasien: pasien, // Pass the existing pasien for editing
        );
      },
    );
  }

  void _deletePasien(int pasienId) {
    setState(() {
      pasiens.removeWhere((pasien) => pasien.id == pasienId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.pasienPage),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pasiens.length,
        itemBuilder: (context, index) {
          return PasienCard(
            pasien: pasiens[index],
            onDelete: _deletePasien,
            onEdit: _showEditPasienBottomSheet,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPasienBottomSheet,
        tooltip: 'Add Pasien',
        child: const Icon(Icons.add),
      ),
    );
  }
}
