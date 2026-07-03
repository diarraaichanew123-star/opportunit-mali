import 'package:flutter/material.dart';
import 'package:projet1/pages/user/acceuil.dart';
import 'package:projet1/pages/user/favorie.dart';
import 'package:projet1/pages/user/profile.dart';

class CandidaturesScreen extends StatefulWidget {
  const CandidaturesScreen({super.key});

  @override
  State<CandidaturesScreen> createState() => _CandidaturesScreenState();
}

class _CandidaturesScreenState extends State<CandidaturesScreen> {
  //-------------------------------------------------
  // Filtre sélectionné
  //-------------------------------------------------
  String selectedFilter = "Toutes";

  //-------------------------------------------------
  // Index sélectionnée
  //-------------------------------------------------
  int selectedIndex = 2;

  //-------------------------------------------------
  // Liste des filtres
  //-------------------------------------------------
  final List<String> filters = [
    "Toutes",
    "En attente",
    "En revue",
    "Acceptée",
    "Refusée",
  ];

  //-------------------------------------------------
  // Données temporaires
  //-------------------------------------------------
  final List<Map<String, dynamic>> candidatures = [
    {
      "titre": "Stage Développeur Flutter",
      "organisation": "Orange Mali",
      "date": "20 Mai 2026",
      "statut": "En attente",
      "icon": Icons.computer,
    },
    {
      "titre": "Bourse Master IA",
      "organisation": "DAAD",
      "date": "10 Mai 2026",
      "statut": "Acceptée",
      "icon": Icons.school,
    },
    {
      "titre": "Concours Fonction Publique",
      "organisation": "État du Mali",
      "date": "02 Juin 2026",
      "statut": "En revue",
      "icon": Icons.emoji_events,
    },
    {
      "titre": "Stage Marketing Digital",
      "organisation": "Moov Africa",
      "date": "15 Avril 2026",
      "statut": "Refusée",
      "icon": Icons.work,
    },
  ];

  //-------------------------------------------------
  // Filtrage
  //-------------------------------------------------
  List<Map<String, dynamic>> get filteredCandidatures {
    if (selectedFilter == "Toutes") {
      return candidatures;
    }

    return candidatures.where((candidature) {
      return candidature["statut"] == selectedFilter;
    }).toList();
  }

  //-------------------------------------------------
  // Couleur du statut
  //-------------------------------------------------
  Color getStatusColor(String statut) {
    switch (statut) {
      case "En attente":
        return Colors.orange;

      case "En revue":
        return Colors.blue;

      case "Acceptée":
        return Colors.green;

      case "Refusée":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

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

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.black),
        ),

        title: const Text(
          "Mes candidatures",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      //-------------------------------------------------
      // BODY
      //-------------------------------------------------
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //-------------------------------------------------
            // FILTRES
            //-------------------------------------------------
            SizedBox(
              height: 40,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: filters.length,

                itemBuilder: (context, index) {
                  final filter = filters[index];

                  final isSelected = selectedFilter == filter;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),

                    child: ChoiceChip(
                      label: Text(filter),

                      selected: isSelected,

                      selectedColor: const Color(0xFF1B8F4D),

                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),

                      onSelected: (_) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------------------
            // LISTE
            //-------------------------------------------------
            Expanded(
              child: filteredCandidatures.isEmpty
                  ? const Center(child: Text("Aucune candidature trouvée"))
                  : ListView.builder(
                      itemCount: filteredCandidatures.length,

                      itemBuilder: (context, index) {
                        final candidature = filteredCandidatures[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 15),

                          elevation: 2,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15),

                            child: Row(
                              children: [
                                //-------------------------------------------------
                                // ICONE
                                //-------------------------------------------------
                                CircleAvatar(
                                  radius: 28,

                                  backgroundColor: const Color(0xFF1B8F4D),

                                  child: Icon(
                                    candidature["icon"],
                                    color: Colors.white,
                                  ),
                                ),

                                const SizedBox(width: 15),

                                //-------------------------------------------------
                                // INFOS
                                //-------------------------------------------------
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        candidature["titre"],

                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 5),

                                      Text(candidature["organisation"]),

                                      const SizedBox(height: 5),

                                      Text(
                                        "Postulée le ${candidature["date"]}",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      //-------------------------------------------------
                                      // BADGE
                                      //-------------------------------------------------
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),

                                        decoration: BoxDecoration(
                                          color: getStatusColor(
                                            candidature["statut"],
                                          ).withOpacity(0.15),

                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),

                                        child: Text(
                                          candidature["statut"],

                                          style: TextStyle(
                                            color: getStatusColor(
                                              candidature["statut"],
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //-------------------------------------------------
                                // DETAILS
                                //-------------------------------------------------
                                IconButton(
                                  onPressed: () {
                                    // écran détail candidature plus tard
                                  },

                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
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
