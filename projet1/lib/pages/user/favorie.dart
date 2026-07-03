import 'package:flutter/material.dart';
import 'package:projet1/pages/user/acceuil.dart';
import 'package:projet1/pages/user/candidature.dart';
import 'package:projet1/pages/user/profile.dart';

class FavorisScreen extends StatefulWidget {
  const FavorisScreen({super.key});

  @override
  State<FavorisScreen> createState() => _FavorisScreenState();
}

class _FavorisScreenState extends State<FavorisScreen> {
  //-------------------------------------------------
  // Index sélectionnée
  //-------------------------------------------------
  int selectedIndex = 1;

  //-------------------------------------------------
  // Données temporaires
  //-------------------------------------------------
  List<Map<String, dynamic>> favoris = [
    {
      "titre": "Bourse Master IA",
      "organisation": "DAAD",
      "lieu": "Allemagne",
      "date": "15 Juillet 2026",
      "icon": Icons.school,
      "isFavorite": true,
    },
    {
      "titre": "Formation Data Science",
      "organisation": "Simplon Mali",
      "lieu": "Bamako",
      "date": "01 Août 2026",
      "icon": Icons.menu_book,
      "isFavorite": true,
    },
    {
      "titre": "Stage UI/UX Design",
      "organisation": "Wave Digital",
      "lieu": "Bamako",
      "date": "30 Juin 2026",
      "icon": Icons.computer,
      "isFavorite": true,
    },
    {
      "titre": "Emploi Community Manager",
      "organisation": "Yeleen Mali",
      "lieu": "Bamako",
      "date": "20 Juin 2026",
      "icon": Icons.work,
      "isFavorite": true,
    },
  ];

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
          "Mes Favoris",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: Colors.black),
      ),

      //-------------------------------------------------
      // BODY
      //-------------------------------------------------
      body: favoris.isEmpty
          ? const Center(child: Text("Aucune opportunité enregistrée."))
          : ListView.builder(
              padding: const EdgeInsets.all(20),

              itemCount: favoris.length,

              itemBuilder: (context, index) {
                final offre = favoris[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),

                  elevation: 2,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),

                    //-------------------------------------------------
                    // ICONE
                    //-------------------------------------------------
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: const Color(0xFF1B8F4D),

                      child: Icon(offre["icon"], color: Colors.white),
                    ),

                    //-------------------------------------------------
                    // INFORMATIONS
                    //-------------------------------------------------
                    title: Text(
                      offre["titre"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const SizedBox(height: 5),

                        Text(offre["organisation"]),

                        Text("📍 ${offre["lieu"]}"),

                        Text("⏰ ${offre["date"]}"),
                      ],
                    ),

                    //-------------------------------------------------
                    // FAVORI
                    //-------------------------------------------------
                    trailing: IconButton(
                      icon: Icon(
                        offre["isFavorite"]
                            ? Icons.favorite
                            : Icons.favorite_border,

                        color: Colors.red,
                      ),

                      onPressed: () {
                        setState(() {
                          favoris.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Offre retirée des favoris"),
                          ),
                        );
                      },
                    ),

                    //-------------------------------------------------
                    // DETAIL
                    //-------------------------------------------------
                    onTap: () {
                      // DetailOpportunityScreen
                    },
                  ),
                );
              },
            ),

      //-------------------------------------------------
      // BOTTOM BAR
      //-------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        type: BottomNavigationBarType
            .fixed, // 🔥 important pour afficher tous les labels

        selectedItemColor: const Color(0xFF1B8F4D),
        unselectedItemColor: Colors.grey,

        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        showSelectedLabels: true,
        showUnselectedLabels: true,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AcceuilScreen()),
            );
          }

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavorisScreen()),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CandidaturesScreen()),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilScreen()),
            );
          }
        },

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
}
