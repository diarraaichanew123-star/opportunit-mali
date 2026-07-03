import 'package:flutter/material.dart';
import 'package:projet1/pages/user/acceuil.dart';
import 'package:projet1/pages/auth/inscription.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Contrôleurs des champs
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // Permet de cacher/afficher le mot de passe
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              //------------------------------------------------
              // TITRE
              //------------------------------------------------
              const Center(
                child: Text(
                  "Connexion",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B8F4D),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Center(
                child: Text(
                  "Bienvenue !\nConnectez-vous pour accéder aux opportunités.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              //------------------------------------------------
              // EMAIL
              //------------------------------------------------
              TextField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: "Email",

                  hintText: "exemple@email.com",

                  prefixIcon: const Icon(Icons.email_outlined),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),

                    borderSide: const BorderSide(
                      color: Color(0xFF1B8F4D),
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //------------------------------------------------
              // MOT DE PASSE
              //------------------------------------------------
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,

                decoration: InputDecoration(
                  labelText: "Mot de passe",

                  prefixIcon: const Icon(Icons.lock_outline),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),

                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),

                    borderSide: const BorderSide(
                      color: Color(0xFF1B8F4D),
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //------------------------------------------------
              // MOT DE PASSE OUBLIE
              //------------------------------------------------
              Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Fonctionnalité disponible prochainement.",
                        ),
                      ),
                    );
                  },

                  child: const Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(color: Color(0xFF1B8F4D)),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //------------------------------------------------
              // BOUTON CONNEXION
              //------------------------------------------------
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B8F4D),

                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {
                    // Plus tard :
                    // appel API Spring Boot + JWT

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const AcceuilScreen()),
                    );
                  },

                  child: const Text(
                    "Se connecter",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              //------------------------------------------------
              // SEPARATEUR
              //------------------------------------------------
              const Row(
                children: [
                  Expanded(child: Divider()),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),

                    child: Text("OU"),
                  ),

                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 35),

              //------------------------------------------------
              // GOOGLE
              //------------------------------------------------
              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton.icon(
                  icon: const Icon(Icons.g_mobiledata, size: 35),

                  label: const Text(
                    "Continuer avec Google",
                    style: TextStyle(fontSize: 16),
                  ),

                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {
                    // Google Sign-In plus tard
                  },
                ),
              ),

              const SizedBox(height: 35),

              //------------------------------------------------
              // INSCRIPTION
              //------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("Pas encore de compte ?"),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const InscriptionScreen(),
                        ),
                      );
                    },

                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(
                        color: Color(0xFF1B8F4D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
