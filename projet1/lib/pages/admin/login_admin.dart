import 'package:flutter/material.dart';
import 'package:projet1/pages/user/acceuil.dart';

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({super.key});

  @override
  State<LoginAdminScreen> createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {
  //-------------------------------------------------
  // Controllers
  //-------------------------------------------------
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //-------------------------------------------------
  // Show/Hide password
  //-------------------------------------------------
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      //-------------------------------------------------
      // BODY
      //-------------------------------------------------
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Container(
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                //-------------------------------------------------
                // TITLE
                //-------------------------------------------------
                const Text(
                  "ADMIN LOGIN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B8F4D),
                  ),
                ),

                const SizedBox(height: 20),

                //-------------------------------------------------
                // LOGO
                //-------------------------------------------------
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF1B8F4D),
                  child: Icon(
                    Icons.admin_panel_settings,
                    color: Colors.white,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 30),

                //-------------------------------------------------
                // EMAIL
                //-------------------------------------------------
                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    labelText: "Email",

                    prefixIcon: const Icon(Icons.email),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                //-------------------------------------------------
                // PASSWORD
                //-------------------------------------------------
                TextField(
                  controller: passwordController,

                  obscureText: obscurePassword,

                  decoration: InputDecoration(
                    labelText: "Mot de passe",

                    prefixIcon: const Icon(Icons.lock),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
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

                const SizedBox(height: 30),

                //-------------------------------------------------
                // BUTTON
                //-------------------------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B8F4D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    onPressed: () {
                      // TODO: Auth admin JWT
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Connexion admin en cours..."),
                        ),
                      );
                    },

                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                //-------------------------------------------------
                // BACK USER APP
                //-------------------------------------------------
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AcceuilScreen()),
                    );
                  },
                  child: const Text(
                    "Retour à l'application",
                    style: TextStyle(color: Colors.black54),
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
