import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1.5)),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'ou',
            style: GoogleFonts.robotoSlab(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const Expanded(child: Divider(thickness: 1.5)),
      ],
    );
  }
}
