import 'package:flutter/material.dart';
import 'package:klinik_app/models/poli.dart';
import 'package:klinik_app/theme/config.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;
  final Function(String) onDelete;

  const PoliDetail({
    super.key,
    required this.poli,
    required this.onDelete,
  });

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  void _showEditBottomSheet() {
    final TextEditingController nameController =
        TextEditingController(text: widget.poli.poliName);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Edit Poli Name',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Poli Name'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty) {
                        setState(() {
                          widget.poli.poliName =
                              nameController.text; // Update the name
                        });
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.poliDetail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Poli Name: ${widget.poli.poliName ?? 'No Name'}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Added spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showEditBottomSheet,
                    child: const Text("Ubah"),
                  ),
                ),
                const SizedBox(width: 10), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _hapus();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("Hapus"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _hapus() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Poli"),
          content: const Text("Are you sure you want to delete this Poli?"),
          actions: [
            TextButton(
              onPressed: () {
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete(widget.poli.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Poli deleted!")),
                );
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }
}
