import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int) onTabSelected;
  final int selectedIndex;

  const BottomNavigation({
    super.key,
    required this.onTabSelected,
    required this.selectedIndex,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildNavbarItem(Icons.home, 'Beranda', 0),
              buildNavbarItem(Icons.home_repair_service, 'Poli', 1),
              buildNavbarItem(Icons.people_alt_outlined, 'Pegawai', 2),
              buildNavbarItem(Icons.people_outline_sharp, 'Pasien', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavbarItem(IconData icon, String label, int index) {
    bool isSelected = widget.selectedIndex == index;

    Color selectedColor = isSelected ? Colors.blue : Colors.black;

    return InkWell(
      onTap: () => widget.onTabSelected(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: selectedColor),
            Text(
              label,
              style: TextStyle(color: selectedColor),
            ),
          ],
        ),
      ),
    );
  }
}
