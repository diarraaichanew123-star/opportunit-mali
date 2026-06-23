import 'package:flutter/material.dart';
import 'package:projet1/pages/auth/offres_par_categorie_screen.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Opportunités Mali",
          style: TextStyle(
            color: Color(0xFF1B8F4D),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),

          Padding(
            padding: const EdgeInsets.only(right: 12),

            child: CircleAvatar(
              backgroundColor: Color(0xFF1B8F4D),
              child: Text("A", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Bonjour 👋",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 5),

              const Text(
                "Que recherchez-vous aujourd'hui ?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher une opportunité...",

                  prefixIcon: const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const SizedBox(height: 20),

              SizedBox(
                height: 45,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    _categoryButton(context, "Stages", Icons.computer),

                    _categoryButton(context, "Bourses", Icons.school),

                    _categoryButton(context, "Emplois", Icons.work),

                    _categoryButton(context, "Concours", Icons.emoji_events),

                    _categoryButton(context, "Formations", Icons.menu_book),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Dernières opportunités",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              OpportunityCard(
                title: "Stage Développeur Flutter",
                organisation: "Orange Mali",
                deadline: "30 Juin 2026",
                category: "Stage",
              ),

              OpportunityCard(
                title: "Bourse Master IA",
                organisation: "Université de Bamako",
                deadline: "15 Juillet 2026",
                category: "Bourse",
              ),

              OpportunityCard(
                title: "Formation Cybersécurité",
                organisation: "Tech Academy Mali",
                deadline: "20 Juin 2026",
                category: "Formation",
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favoris",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpportunityCard extends StatelessWidget {
  final String title;
  final String organisation;
  final String deadline;
  final String category;

  const OpportunityCard({
    super.key,
    required this.title,
    required this.organisation,
    required this.deadline,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF1B8F4D),
          child: Icon(Icons.work_outline, color: Colors.white),
        ),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text("$organisation\nDate limite : $deadline"),

        trailing: Chip(label: Text(category)),
      ),
    );
  }
}

Widget _categoryButton(BuildContext context, String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),

    child: ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OffresParCategorieScreen(categorie: title),
          ),
        );
      },

      icon: Icon(icon, size: 18),

      label: Text(title),

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1B8F4D),

        elevation: 2,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    ),
  );
}
