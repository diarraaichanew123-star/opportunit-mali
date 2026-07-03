import 'package:flutter/material.dart';
import 'package:projet1/pages/user/detailOpportunit%C3%A9.dart';

class AcceuilScreen extends StatefulWidget {
  const AcceuilScreen({super.key});

  @override
  State<AcceuilScreen> createState() => _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> {
  //-------------------------------------------------
  // Catégorie sélectionnée
  //-------------------------------------------------
  String selectedCategory = "Tous";

  //-------------------------------------------------
  // Texte de recherche
  //-------------------------------------------------
  String searchText = "";

  //-------------------------------------------------
  // Liste des catégories
  //-------------------------------------------------
  final List<String> categories = [
    "Tous",
    "Stages",
    "Bourses",
    "Emplois",
    "Concours",
    "Formations",
  ];

  //-------------------------------------------------
  // Données temporaires
  // Plus tard elles viendront de Spring Boot
  //-------------------------------------------------
  final List<Map<String, dynamic>> opportunities = [
    {
      "title": "Stage Développeur Flutter",
      "organisation": "Orange Mali",
      "location": "Bamako",
      "deadline": "30 Juin 2026",
      "category": "Stages",
      "icon": Icons.computer,
    },
    {
      "title": "Bourse Master Intelligence Artificielle",
      "organisation": "Université de Bamako",
      "location": "Mali",
      "deadline": "15 Juillet 2026",
      "category": "Bourses",
      "icon": Icons.school,
    },
    {
      "title": "Formation en Cybersécurité",
      "organisation": "Tech Academy Mali",
      "location": "Bamako",
      "deadline": "20 Juin 2026",
      "category": "Formations",
      "icon": Icons.menu_book,
    },
    {
      "title": "Développeur Java Junior",
      "organisation": "Malitel",
      "location": "Bamako",
      "deadline": "25 Juin 2026",
      "category": "Emplois",
      "icon": Icons.work,
    },
    {
      "title": "Concours de la Fonction Publique",
      "organisation": "État du Mali",
      "location": "Mali",
      "deadline": "12 Juillet 2026",
      "category": "Concours",
      "icon": Icons.emoji_events,
    },
  ];

  //-------------------------------------------------
  // Filtrage des opportunités
  //-------------------------------------------------
  List<Map<String, dynamic>> get filteredOpportunities {
    return opportunities.where((opportunity) {
      final categoryMatch =
          selectedCategory == "Tous" ||
          opportunity["category"] == selectedCategory;

      final searchMatch = opportunity["title"].toLowerCase().contains(
        searchText.toLowerCase(),
      );

      return categoryMatch && searchMatch;
    }).toList();
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

        title: const Text(
          "Opportunités Mali",
          style: TextStyle(
            color: Color(0xFF1B8F4D),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Color(0xFF1B8F4D),
              child: Text("A", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
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
            // SALUTATION
            //-------------------------------------------------
            const Text(
              "Bonjour 👋",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 5),

            const Text(
              "Trouvez votre prochaine opportunité",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            //-------------------------------------------------
            // BARRE DE RECHERCHE
            //-------------------------------------------------
            TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },

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

            const SizedBox(height: 25),

            //-------------------------------------------------
            // CATEGORIES
            //-------------------------------------------------
            SizedBox(
              height: 45,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: categories.length,

                itemBuilder: (context, index) {
                  final category = categories[index];

                  final isSelected = category == selectedCategory;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),

                    child: ChoiceChip(
                      label: Text(category),

                      selected: isSelected,

                      selectedColor: const Color(0xFF1B8F4D),

                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),

                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            //-------------------------------------------------
            // TITRE
            //-------------------------------------------------
            const Text(
              "Opportunités disponibles",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            //-------------------------------------------------
            // LISTE DES OFFRES
            //-------------------------------------------------
            Expanded(
              child: filteredOpportunities.isEmpty
                  ? const Center(child: Text("Aucune opportunité trouvée."))
                  : ListView.builder(
                      itemCount: filteredOpportunities.length,

                      itemBuilder: (context, index) {
                        final opportunity = filteredOpportunities[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 15),

                          elevation: 2,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: ListTile(
                            contentPadding: const EdgeInsets.all(15),

                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFF1B8F4D),

                              child: Icon(
                                opportunity["icon"],
                                color: Colors.white,
                              ),
                            ),

                            title: Text(
                              opportunity["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                const SizedBox(height: 8),

                                Text(opportunity["organisation"]),

                                Text("📍 ${opportunity["location"]}"),

                                Text("⏰ ${opportunity["deadline"]}"),
                              ],
                            ),

                            //-------------------------------------------------
                            // OUVERTURE DE LA PAGE DETAIL
                            //-------------------------------------------------
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),

                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailOpportunityScreen(
                                      title: opportunity["title"],
                                      organisation: opportunity["organisation"],
                                      category: opportunity["category"],
                                      location: opportunity["location"],
                                      deadline: opportunity["deadline"],
                                    ),
                                  ),
                                );
                              },
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
      // BOTTOM NAVIGATION BAR
      //-------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
}
