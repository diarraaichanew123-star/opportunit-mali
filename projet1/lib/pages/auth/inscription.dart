import 'package:flutter/material.dart';
import 'package:projet1/pages/user/acceuil.dart';
import 'package:projet1/pages/auth/login_screen.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  // Contrôleurs des champs
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final telephoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  // Afficher ou cacher les mots de passe
  bool obscurePassword = true;
  bool obscureConfirm = true;

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
                  "Créer un compte",
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
                  "Rejoignez Opportunités Mali\net accédez aux meilleures opportunités.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              //------------------------------------------------
              // NOM
              //------------------------------------------------
              TextField(
                controller: nomController,
                decoration: InputDecoration(
                  labelText: "Nom",
                  prefixIcon: const Icon(Icons.person),

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

              const SizedBox(height: 20),

              //------------------------------------------------
              // PRENOM
              //------------------------------------------------
              TextField(
                controller: prenomController,
                decoration: InputDecoration(
                  labelText: "Prénom",
                  prefixIcon: const Icon(Icons.person),

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

              const SizedBox(height: 20),

              //------------------------------------------------
              // EMAIL
              //------------------------------------------------
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),

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

              const SizedBox(height: 20),

              //------------------------------------------------
              // TELEPHONE
              //------------------------------------------------
              TextField(
                controller: telephoneController,
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                  labelText: "Téléphone",
                  prefixIcon: const Icon(Icons.phone),

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

              const SizedBox(height: 20),

              //------------------------------------------------
              // MOT DE PASSE
              //------------------------------------------------
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,

                decoration: InputDecoration(
                  labelText: "Mot de passe",

                  prefixIcon: const Icon(Icons.lock),

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
                ),
              ),

              const SizedBox(height: 20),

              //------------------------------------------------
              // CONFIRMATION
              //------------------------------------------------
              TextField(
                controller: confirmController,
                obscureText: obscureConfirm,

                decoration: InputDecoration(
                  labelText: "Confirmer le mot de passe",

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirm ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirm = !obscureConfirm;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              //------------------------------------------------
              // BOUTON INSCRIPTION
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
                    // Appel API Spring Boot plus tard

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const AcceuilScreen()),
                    );
                  },

                  child: const Text(
                    "S'inscrire",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 30),

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

              const SizedBox(height: 30),

              //------------------------------------------------
              // GOOGLE
              //------------------------------------------------
              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton.icon(
                  icon: const Icon(Icons.g_mobiledata, size: 35),

                  label: const Text("Continuer avec Google"),

                  onPressed: () {
                    // Google Sign In plus tard
                  },
                ),
              ),

              const SizedBox(height: 25),

              //------------------------------------------------
              // LOGIN
              //------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("Déjà un compte ?"),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },

                    child: const Text(
                      "Se connecter",
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
