import 'package:aluminex_client/features/home/home_view.dart';
import 'package:aluminex_client/features/profile/profile_view.dart';
import 'package:aluminex_core/aluminex_core.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AluminexAppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: IndexedStack(
                index: _selectedIndex,
                children: const [
                  HomeView(),
                  ProfileView(),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(245, 55, 69, 1),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'Home',
            icon: Icon(Icons.house),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'Perfil',
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
