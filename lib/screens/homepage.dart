import 'package:flutter/material.dart';
import 'package:klinik_app/screens/pasien/pasien_screen.dart';
import 'package:klinik_app/screens/pegawai/pegawai_screen.dart';
import 'package:klinik_app/screens/poli/poli_screen.dart';
import 'package:klinik_app/theme/config.dart';
import 'package:klinik_app/widgets/helpers/margin/margin.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Selamat Datang di ${Config.appName}",
                style: TextStyle(fontSize: 26),
              ),
              const Margin(height: 50),
              Menu(
                title: "Halaman Poli",
                onPressed: () {
                  _navigateTo(context, const PoliScreen());
                },
              ),
              const Margin(height: 10),
              Menu(
                title: "Halaman Pasien",
                onPressed: () {
                  _navigateTo(context, const PasienScreen());
                },
              ),
              const Margin(height: 10),
              Menu(
                title: "Halaman Pegawai",
                onPressed: () {
                  _navigateTo(context, const PegawaiScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const Menu({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(title),
        ),
      ),
    );
  }
}
