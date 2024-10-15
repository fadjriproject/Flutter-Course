import 'package:flutter/material.dart';

class PoliForm extends StatefulWidget {
  final Function(String) addPoli; // Add this line
  final TextEditingController nameController;
  const PoliForm({
    super.key,
    required this.addPoli, // Update constructor
    required this.nameController,
  });

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  @override
  Widget build(BuildContext context) {
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
                'Add New Poli',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(
                controller: widget.nameController,
                decoration: const InputDecoration(labelText: 'Poli Name'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (widget.nameController.text.isNotEmpty) {
                    widget.addPoli(
                        widget.nameController.text); // Call the callback
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Poli'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
