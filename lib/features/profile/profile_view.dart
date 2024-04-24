import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.grey.shade300,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SizedBox(
            height: sizeOf.height * .68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                const CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Editar foto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text('Meus dados'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text('Fale conosco'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: const Color.fromRGBO(245, 55, 69, 1),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  child: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
