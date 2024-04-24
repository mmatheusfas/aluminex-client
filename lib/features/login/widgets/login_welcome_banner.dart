import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWelcomeBanner extends StatelessWidget {
  const LoginWelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    return Container(
      height: sizeOf.height * .33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 70,
            right: 70,
            bottom: 40,
            top: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/login_background.png',
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 20,
            child: Text(
              'Bem vindo a \nAluminex Brasil!',
              style: GoogleFonts.robotoSlab(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
