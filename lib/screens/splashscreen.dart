import 'package:cilore/screens/dashboardscreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,  // Memastikan kontainer mengisi lebar layar
        height: double.infinity, // Memastikan kontainer mengisi tinggi layar
        decoration: const BoxDecoration(
          color: Color(0xFFF4E3CF), // Warna latar belakang krem
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.3,
              child: Image.asset(
                "assets/backround.png",
                width: screenSize.width,  
                height: screenSize.height, 
                fit: BoxFit.cover,  
              ),
            ),
            Lottie.network(
              'https://lottie.host/646c32be-1d0c-4f75-800d-b0b2ecbb7c9e/7njfv0UrcJ.json',
              width: 300,
              height: 300,
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 320,
                ),
                Text(
                  'CILORE',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B4E3D), // Warna teks cokelat
                    fontFamily: 'NunitoSansBold',
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Cipanas Culinary Review',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B4E3D), // Warna teks cokelat
                    fontFamily: 'NunitoSansBold',
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
