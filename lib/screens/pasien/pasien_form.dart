import 'package:flutter/material.dart';
import 'package:klinik_app/models/pasien.dart';
import 'package:intl/intl.dart';

class PasienForm extends StatefulWidget {
  final Function(Pasien newPasien) onAddPasien;
  final Pasien? pasien; // Optional parameter for editing

  const PasienForm({
    super.key,
    required this.onAddPasien,
    this.pasien, // Add this line
  });

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'noRM': TextEditingController(),
    'nama': TextEditingController(),
    'penyakit': TextEditingController(),
    'tglLahir': TextEditingController(),
    'noTelepon': TextEditingController(),
    'alamat': TextEditingController(),
  };

  final Map<String, FocusNode> _focusNodes = {
    'noRM': FocusNode(),
    'nama': FocusNode(),
    'penyakit': FocusNode(),
    'tglLahir': FocusNode(),
    'noTelepon': FocusNode(),
    'alamat': FocusNode(),
  };

  @override
  void initState() {
    super.initState();
    // If pasien is provided, initialize controllers with its data
    if (widget.pasien != null) {
      _controllers['noRM']!.text = widget.pasien?.noRM ?? '';
      _controllers['nama']!.text = widget.pasien?.nama ?? '';
      _controllers['penyakit']!.text = widget.pasien?.penyakit ?? '';
      _controllers['tglLahir']!.text = widget.pasien?.tglLahir ?? '';
      _controllers['noTelepon']!.text = widget.pasien?.noTelepon ?? '';
      _controllers['alamat']!.text = widget.pasien?.alamat ?? '';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _controllers['tglLahir']!.text =
            DateFormat('dd/MM/yyyy').format(pickedDate);
      });
      _focusNodes['noTelepon']!.requestFocus();
    }
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      Pasien newPasien = Pasien(
        widget.pasien?.id ?? 1, // Use existing id or set a new one
        _controllers['noRM']!.text,
        _controllers['nama']!.text,
        _controllers['penyakit']!.text,
        _controllers['tglLahir']!.text,
        _controllers['noTelepon']!.text,
        _controllers['alamat']!.text,
      );

      widget.onAddPasien(newPasien);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.pasien == null ? "Add New Pasien" : "Edit Pasien",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ..._controllers.entries.map((entry) {
                  if (entry.key == 'tglLahir') {
                    return GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: entry.value,
                          decoration:
                              const InputDecoration(labelText: 'Tgl Lahir'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Tgl Lahir';
                            }
                            return null;
                          },
                        ),
                      ),
                    );
                  } else {
                    return TextFormField(
                      controller: entry.value,
                      focusNode: _focusNodes[entry.key],
                      decoration: InputDecoration(labelText: entry.key),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ${entry.key}';
                        }
                        return null;
                      },
                    );
                  }
                }).toList(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: Text(widget.pasien == null
                      ? "Tambah Pasien"
                      : "Update Pasien"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    _focusNodes.forEach((_, focusNode) => focusNode.dispose());
    super.dispose();
  }
}
