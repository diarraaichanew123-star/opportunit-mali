import 'package:flutter/material.dart';

class DashboardAdminScreen extends StatelessWidget {
  const DashboardAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      //------------------------------------------------
      // APP BAR
      //------------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Dashboard Admin",
          style: TextStyle(
            color: Color(0xFF1B8F4D),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Color(0xFF1B8F4D),
              child: Text("A", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),

      //------------------------------------------------
      // BODY (IMPORTANT : SCROLL FIX)
      //------------------------------------------------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vue générale",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              //------------------------------------------------
              // STATS CARDS
              //------------------------------------------------
              Row(
                children: [
                  // Opportunités
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.work,
                      label: "Opportunités",
                      value: "120",
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Utilisateurs
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.people,
                      label: "Utilisateurs",
                      value: "540",
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.category,
                      label: "Catégories",
                      value: "12",
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.description,
                      label: "Candidatures",
                      value: "2356",
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              //------------------------------------------------
              // SECTION GRAPHIQUE (placeholder)
              //------------------------------------------------
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Graphique des opportunités",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //------------------------------------------------
              // ACTIONS ADMIN
              //------------------------------------------------
              const Text(
                "Actions rapides",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              _buildActionTile(Icons.add, "Ajouter une offre"),
              _buildActionTile(Icons.edit, "Gérer les offres"),
              _buildActionTile(Icons.category, "Gérer les catégories"),
              _buildActionTile(Icons.people, "Gérer les utilisateurs"),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  //------------------------------------------------
  // WIDGET : STAT CARD
  //------------------------------------------------
  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  //------------------------------------------------
  // WIDGET : ACTION TILE
  //------------------------------------------------
  Widget _buildActionTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1B8F4D)),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
