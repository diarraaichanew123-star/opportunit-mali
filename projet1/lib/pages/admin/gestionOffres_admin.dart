import 'package:flutter/material.dart';

class GestionOffresScreen extends StatefulWidget {
  const GestionOffresScreen({super.key});

  @override
  State<GestionOffresScreen> createState() => _GestionOffresScreenState();
}

class _GestionOffresScreenState extends State<GestionOffresScreen> {
  //-------------------------------------------------
  // Données temporaires (plus tard API Spring Boot)
  //-------------------------------------------------
  final List<Map<String, dynamic>> offres = [
    {
      "title": "Stage Développeur Flutter",
      "organisation": "Orange Mali",
      "location": "Bamako",
      "deadline": "30 Juin 2026",
      "status": "Actif",
    },
    {
      "title": "Bourse Master IA",
      "organisation": "Université de Bamako",
      "location": "Mali",
      "deadline": "15 Juillet 2026",
      "status": "Actif",
    },
  ];

  //-------------------------------------------------
  // SUPPRIMER UNE OFFRE
  //-------------------------------------------------
  void deleteOffre(int index) {
    setState(() {
      offres.removeAt(index);
    });
  }

  //-------------------------------------------------
  // ARCHIVER UNE OFFRE
  //-------------------------------------------------
  void archiveOffre(int index) {
    setState(() {
      offres[index]["status"] = "Archivé";
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
          "Gestion des Offres",
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
            // BUTTON AJOUT
            //-------------------------------------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: ouvrir formulaire ajout offre
                },
                icon: const Icon(Icons.add),
                label: const Text("Ajouter une offre"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B8F4D),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------------------
            // LISTE OFFRES
            //-------------------------------------------------
            Expanded(
              child: ListView.builder(
                itemCount: offres.length,
                itemBuilder: (context, index) {
                  final offre = offres[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //-------------------------------------------------
                          // TITRE
                          //-------------------------------------------------
                          Text(
                            offre["title"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(offre["organisation"]),
                          Text(offre["location"]),
                          Text("Deadline: ${offre["deadline"]}"),

                          const SizedBox(height: 10),

                          //-------------------------------------------------
                          // STATUS
                          //-------------------------------------------------
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: offre["status"] == "Actif"
                                  ? Colors.green
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              offre["status"],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),

                          const SizedBox(height: 10),

                          //-------------------------------------------------
                          // ACTIONS
                          //-------------------------------------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  // TODO: modifier offre
                                },
                                icon: const Icon(Icons.edit),
                                label: const Text("Modifier"),
                              ),

                              TextButton.icon(
                                onPressed: () {
                                  deleteOffre(index);
                                },
                                icon: const Icon(Icons.delete),
                                label: const Text("Supprimer"),
                              ),

                              TextButton.icon(
                                onPressed: () {
                                  archiveOffre(index);
                                },
                                icon: const Icon(Icons.archive),
                                label: const Text("Archiver"),
                              ),
                            ],
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
