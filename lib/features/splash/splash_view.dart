import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_aluminex.jpeg',
          ),
          const SizedBox(height: 40),
          Text(
            'Aluminex Brasil',
            style: GoogleFonts.robotoSlab(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'Soluções em portas',
            style: GoogleFonts.robotoSlab(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: const Icon(
                Icons.arrow_right,
                size: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
