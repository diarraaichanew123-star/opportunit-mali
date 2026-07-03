import 'package:flutter/material.dart';

class GestionCategoriesScreen extends StatefulWidget {
  const GestionCategoriesScreen({super.key});

  @override
  State<GestionCategoriesScreen> createState() =>
      _GestionCategoriesScreenState();
}

class _GestionCategoriesScreenState extends State<GestionCategoriesScreen> {
  //-------------------------------------------------
  // Liste des catégories (temporaire)
  //-------------------------------------------------
  final List<Map<String, dynamic>> categories = [
    {"name": "Stages", "icon": Icons.work},
    {"name": "Bourses", "icon": Icons.school},
    {"name": "Emplois", "icon": Icons.business_center},
    {"name": "Concours", "icon": Icons.emoji_events},
    {"name": "Formations", "icon": Icons.menu_book},
  ];

  //-------------------------------------------------
  // SUPPRIMER
  //-------------------------------------------------
  void deleteCategory(int index) {
    setState(() {
      categories.removeAt(index);
    });
  }

  //-------------------------------------------------
  // AJOUT (placeholder)
  //-------------------------------------------------
  void addCategory() {
    setState(() {
      categories.add({"name": "Nouvelle catégorie", "icon": Icons.category});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      //-------------------------------------------------
      // APP BAR
      //-------------------------------------------------
      appBar: AppBar(
        title: const Text(
          "Gestion des Catégories",
          style: TextStyle(
            color: Color(0xFF1B8F4D),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      //-------------------------------------------------
      // BODY
      //-------------------------------------------------
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            //-------------------------------------------------
            // ADD BUTTON
            //-------------------------------------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: addCategory,
                icon: const Icon(Icons.add),
                label: const Text("Ajouter une catégorie"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B8F4D),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------------------
            // LISTE
            //-------------------------------------------------
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(
                          0xFF1B8F4D,
                        ).withOpacity(0.2),
                        child: Icon(
                          cat["icon"],
                          color: const Color(0xFF1B8F4D),
                        ),
                      ),

                      title: Text(
                        cat["name"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      //-------------------------------------------------
                      // ACTIONS
                      //-------------------------------------------------
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // TODO: modifier catégorie
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              deleteCategory(index);
                            },
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
    );
  }
}
