import 'package:flutter/material.dart';
import 'package:klinik_app/screens/homepage.dart';
import 'package:klinik_app/screens/pasien/pasien_screen.dart';
import 'package:klinik_app/screens/pegawai/pegawai_screen.dart';
import 'package:klinik_app/screens/poli/poli_screen.dart';
import 'package:klinik_app/widgets/templates/bottom_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0; // Keeps track of the selected tab index

  // List of pages to navigate to
  final List<Widget> _pages = [
    const Homepage(), // Page 0
    const PoliScreen(), // Page 1
    const PegawaiScreen(), // Page 2
    const PasienScreen(), // Page 3
  ];

  // Method to handle tab selection
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[
            _selectedIndex], // Display the corresponding page based on the selected tab
        bottomNavigationBar: BottomNavigation(
          selectedIndex: _selectedIndex,
          onTabSelected:
              _onTabSelected, // Pass the callback to BottomNavigation widget
        ),
      ),
    );
  }
}
