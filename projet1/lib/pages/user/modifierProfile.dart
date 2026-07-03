import 'package:flutter/material.dart';

class ModifierProfilScreen extends StatefulWidget {
  const ModifierProfilScreen({super.key});

  @override
  State<ModifierProfilScreen> createState() => _ModifierProfilScreenState();
}

class _ModifierProfilScreenState extends State<ModifierProfilScreen> {
  //-------------------------------------------------
  // Contrôleurs
  //-------------------------------------------------
  final nomController = TextEditingController(text: "Aïcha Diarra");

  final emailController = TextEditingController(text: "aicha@gmail.com");

  final telephoneController = TextEditingController(text: "+223 XX XX XX XX");

  final villeController = TextEditingController(text: "Bamako");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      //-------------------------------------------------
      // APP BAR
      //-------------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Modifier Profil",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: Colors.black),
      ),

      //-------------------------------------------------
      // BODY
      //-------------------------------------------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            //-------------------------------------------------
            // PHOTO
            //-------------------------------------------------
            Stack(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xFF1B8F4D),
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Color(0xFF1B8F4D),
                      ),

                      onPressed: () {
                        // Ajout photo plus tard
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            //-------------------------------------------------
            // NOM
            //-------------------------------------------------
            TextField(
              controller: nomController,

              decoration: InputDecoration(
                labelText: "Nom complet",

                prefixIcon: const Icon(Icons.person),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------------------
            // EMAIL
            //-------------------------------------------------
            TextField(
              controller: emailController,

              keyboardType: TextInputType.emailAddress,

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
            // TELEPHONE
            //-------------------------------------------------
            TextField(
              controller: telephoneController,

              keyboardType: TextInputType.phone,

              decoration: InputDecoration(
                labelText: "Téléphone",

                prefixIcon: const Icon(Icons.phone),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------------------
            // VILLE
            //-------------------------------------------------
            TextField(
              controller: villeController,

              decoration: InputDecoration(
                labelText: "Ville",

                prefixIcon: const Icon(Icons.location_on),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 40),

            //-------------------------------------------------
            // BOUTON
            //-------------------------------------------------
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B8F4D),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Profil mis à jour avec succès."),
                    ),
                  );
                },

                child: const Text(
                  "Enregistrer",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
