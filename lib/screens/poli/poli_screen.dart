import 'package:flutter/material.dart';
import 'package:klinik_app/models/poli.dart';
import 'package:klinik_app/screens/poli/poli_detail.dart';
import 'package:klinik_app/screens/poli/poli_form.dart';
import 'package:klinik_app/theme/config.dart';

class PoliScreen extends StatefulWidget {
  const PoliScreen({super.key});

  @override
  State<PoliScreen> createState() => _PoliScreenState();
}

class _PoliScreenState extends State<PoliScreen> {
  final List<Poli> polies = [
    Poli("1", "Poli Anak"),
    Poli("2", "Poli Kandungan"),
    Poli("3", "Poli THT"),
  ];

  void _showAddPoliBottomSheet() {
    final TextEditingController nameController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return PoliForm(
          addPoli: (String name) {
            setState(() {
              polies.add(Poli((polies.length + 1).toString(), name));
            });
          },
          nameController: nameController,
        );
      },
    );
  }

  void _deletePoli(String poliId) {
    setState(() {
      polies.removeWhere((poli) => poli.id == poliId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.poliPage),
      ),
      body: ListView(
        children: polies.map((poli) {
          return Card(
            child: ListTile(
              title: Text(poli.poliName ?? "No Name"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PoliDetail(
                      poli: poli,
                      onDelete: _deletePoli,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPoliBottomSheet,
        tooltip: 'Add Poli',
        child: const Icon(Icons.add),
      ),
    );
  }
}
