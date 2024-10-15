import 'package:flutter/material.dart';
import 'package:klinik_app/models/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  final Pegawai? pegawai;
  const PegawaiForm({super.key, this.pegawai});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final Map<String, TextEditingController> _controllers = {
    'id': TextEditingController(),
    'nip': TextEditingController(),
    'nama': TextEditingController(),
    'tglLahir': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    if (widget.pegawai != null) {
      _controllers['id']!.text = widget.pegawai!.id.toString();
      _controllers['nip']!.text = widget.pegawai!.nip;
      _controllers['nama']!.text = widget.pegawai!.nama;
      _controllers['tglLahir']!.text = widget.pegawai!.tglLahir.toString();
      _controllers['email']!.text = widget.pegawai!.email;
      // Note: Do not pre-fill password for security reasons
    }
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  widget.pegawai == null ? "Add New Pegawai" : "Edit Pegawai",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ..._buildTextFields(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(widget.pegawai == null ? "Add" : "Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return _controllers.entries.map((entry) {
      return TextField(
        controller: entry.value,
        decoration: InputDecoration(
          labelText: entry.key,
        ),
        obscureText: entry.key == 'password', // Obscure password field
      );
    }).toList();
  }

  void _submitForm() {
    Navigator.of(context).pop(); // Go back after submission
  }
}
