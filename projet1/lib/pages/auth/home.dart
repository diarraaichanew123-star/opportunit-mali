import 'package:flutter/material.dart';
import 'package:projet1/pages/auth/inscription.dart';
import 'package:projet1/pages/auth/login_screen.dart';
import 'package:projet1/pages/user/acceuil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              //------------------------------------------------
              // LOGO
              //------------------------------------------------
              Image.asset("assets/images/logo.png", width: 180, height: 180),

              const SizedBox(height: 30),

              //------------------------------------------------
              // NOM APPLICATION
              //------------------------------------------------
              const Text(
                "Opportunités Mali",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B8F4D),
                ),
              ),

              const SizedBox(height: 15),

              //------------------------------------------------
              // SLOGAN
              //------------------------------------------------
              const Text(
                "Votre avenir commence ici.\nDécouvrez des stages, bourses,\nemplois et formations pour construire votre avenir.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 50),

              //------------------------------------------------
              // BOUTON EXPLORER
              //------------------------------------------------
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B8F4D),
                    foregroundColor: Colors.white,
                    elevation: 3,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AcceuilScreen(),
                      ),
                    );
                  },

                  child: const Text(
                    "Explorer les opportunités",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //------------------------------------------------
              // BOUTON CONNEXION
              //------------------------------------------------
              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF1B8F4D),
                    side: const BorderSide(color: Color(0xFF1B8F4D), width: 2),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },

                  child: const Text(
                    "Se connecter",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //------------------------------------------------
              // BOUTON INSCRIPTION
              //------------------------------------------------
              SizedBox(
                width: double.infinity,
                height: 55,

                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF1B8F4D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InscriptionScreen(),
                      ),
                    );
                  },

                  child: const Text(
                    "Créer un compte",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              //------------------------------------------------
              // A PROPOS
              //------------------------------------------------
              TextButton(
                onPressed: () {},

                child: const Text(
                  "À propos",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
