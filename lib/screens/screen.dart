import 'package:flutter/material.dart';
import 'package:klinik_app/screens/homepage.dart';
import 'package:klinik_app/screens/pasien/pasien_screen.dart';
import 'package:klinik_app/screens/pegawai/pegawai_screen.dart';
import 'package:klinik_app/screens/poli/poli_screen.dart';
import 'package:klinik_app/widgets/templates/bottom_navigation.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Homepage(),
    const PoliScreen(),
    const PegawaiScreen(),
    const PasienScreen(),
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
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigation(
          selectedIndex: _selectedIndex,
          onTabSelected: _onTabSelected,
        ),
      ),
    );
  }
}
