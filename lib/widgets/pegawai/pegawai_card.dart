import 'package:flutter/material.dart';
import 'package:klinik_app/models/pegawai.dart';
import 'package:klinik_app/screens/pegawai/pegawai_detail.dart';
import 'package:klinik_app/widgets/helpers/margin/margin.dart';

class PegawaiCard extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiCard({super.key, required this.pegawai});

  @override
  State<PegawaiCard> createState() => _PegawaiCardState();
}

class _PegawaiCardState extends State<PegawaiCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10), // Add padding here
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            child: Text(widget.pegawai.nama[0]),
          ),
          title: Text(
            widget.pegawai.nama,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Margin(height: 10),
              Text('NIP: ${widget.pegawai.nip}'),
              const Margin(height: 5),
              Text('Email: ${widget.pegawai.email}'),
              const Margin(height: 5),
              Text('Tanggal Lahir: ${widget.pegawai.tglLahir}'),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: widget.pegawai),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
