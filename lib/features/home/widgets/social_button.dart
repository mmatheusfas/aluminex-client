import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.assetPath, required this.url});
  final String assetPath;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/web-view', arguments: url);
      },
      child: Container(
        height: assetPath.contains('youtube') ? 50 : 40,
        width: assetPath.contains('youtube') ? 50 : 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(assetPath),
          ),
        ),
      ),
    );
  }
}
