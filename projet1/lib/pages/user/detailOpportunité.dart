import 'package:flutter/material.dart';
import 'package:projet1/pages/user/postuler.dart';

class DetailOpportunityScreen extends StatelessWidget {
  final String title;
  final String organisation;
  final String category;
  final String location;
  final String deadline;

  const DetailOpportunityScreen({
    super.key,
    required this.title,
    required this.organisation,
    required this.category,
    required this.location,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Détail de l'opportunité",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //------------------------------------------------
            // EN-TÊTE
            //------------------------------------------------
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF1B8F4D),

                      child: Icon(Icons.work, color: Colors.white, size: 30),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            organisation,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),

                          const SizedBox(height: 8),

                          Chip(
                            label: Text(category),
                            backgroundColor: Colors.green.shade100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            //------------------------------------------------
            // INFORMATIONS
            //------------------------------------------------
            const Text(
              "Informations",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            infoTile(Icons.location_on, "Lieu", location),

            infoTile(Icons.school, "Niveau requis", "Licence ou Master"),

            infoTile(Icons.calendar_today, "Date limite", deadline),

            const SizedBox(height: 30),

            //------------------------------------------------
            // DESCRIPTION
            //------------------------------------------------
            const Text(
              "Description",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "Nous recherchons des candidats motivés et passionnés pour rejoindre notre équipe. Cette opportunité vous permettra d'acquérir une expérience professionnelle enrichissante et de développer vos compétences.",
              style: TextStyle(color: Colors.grey.shade700, height: 1.6),
            ),

            const SizedBox(height: 30),

            //------------------------------------------------
            // CONDITIONS
            //------------------------------------------------
            const Text(
              "Conditions",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            conditionTile("Connaissances de base en Flutter"),

            conditionTile("Maîtrise de Git et GitHub"),

            conditionTile("Capacité de travail en équipe"),

            const SizedBox(height: 30),

            //------------------------------------------------
            // FAVORIS
            //------------------------------------------------
            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.favorite_border),

                label: const Text("Ajouter aux favoris"),
              ),
            ),

            const SizedBox(height: 15),

            //------------------------------------------------
            // POSTULER
            //------------------------------------------------
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const PostulerScreen(title: '', organisation: ''),
                    ),
                  );
                },

                child: const Text(
                  "Postuler maintenant",
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

  Widget infoTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),

      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1B8F4D)),

        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  Widget conditionTile(String condition) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),

      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF1B8F4D)),

          const SizedBox(width: 10),

          Expanded(child: Text(condition)),
        ],
      ),
    );
  }
}
