import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

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
          "Mon Profil",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      //-------------------------------------------------
      // BODY
      //-------------------------------------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-------------------------------------------------
            // HEADER PROFIL
            //-------------------------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),

              decoration: const BoxDecoration(
                color: Color(0xFF1B8F4D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFF1B8F4D),
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Aïcha Diarra",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "aicha@gmail.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //-------------------------------------------------
            // MENU DU PROFIL
            //-------------------------------------------------
            _buildTile(
              icon: Icons.person_outline,
              title: "Informations personnelles",
              onTap: () {
                // ModifierProfilScreen
              },
            ),

            _buildTile(
              icon: Icons.description_outlined,
              title: "Mon CV",
              onTap: () {},
            ),

            _buildTile(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {},
            ),

            _buildTile(
              icon: Icons.lock_outline,
              title: "Modifier le mot de passe",
              onTap: () {},
            ),

            _buildTile(
              icon: Icons.settings_outlined,
              title: "Paramètres",
              onTap: () {},
            ),

            _buildTile(
              icon: Icons.logout,
              title: "Déconnexion",
              color: Colors.red,
              onTap: () {
                // Déconnexion
              },
            ),
          ],
        ),
      ),

      //-------------------------------------------------
      // BOTTOM NAVIGATION
      //-------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: const Color(0xFF1B8F4D),

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),

          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoris"),

          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Candidatures",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  //-------------------------------------------------
  // WIDGET MENU
  //-------------------------------------------------
  static Widget _buildTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

      child: Card(
        elevation: 1,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        child: ListTile(
          leading: Icon(icon, color: color),

          title: Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.w500),
          ),

          trailing: const Icon(Icons.arrow_forward_ios, size: 18),

          onTap: onTap,
        ),
      ),
    );
  }
}
