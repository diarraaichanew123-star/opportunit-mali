import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet1/pages/auth/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Attendre 3 secondes puis aller vers HomeScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fond blanc pour un rendu propre et professionnel
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                //---------------------------------------------------
                // LOGO
                //---------------------------------------------------
                Image.asset("assets/images/logo.png", width: 180, height: 180),

                const SizedBox(height: 30),

                //---------------------------------------------------
                // NOM DE L'APPLICATION
                //---------------------------------------------------
                const Text(
                  "Opportunités Mali",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B8F4D),
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 20),

                //---------------------------------------------------
                // SLOGAN
                //---------------------------------------------------
                const Text(
                  "Votre avenir commence ici.",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 50),

                //---------------------------------------------------
                // BARRE DE CHARGEMENT
                //---------------------------------------------------
                SizedBox(
                  width: 180,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),

                    child: const LinearProgressIndicator(
                      minHeight: 6,
                      color: Color(0xFF1B8F4D),
                      backgroundColor: Color(0xFFE0E0E0),
                    ),
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
