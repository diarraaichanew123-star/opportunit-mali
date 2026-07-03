import 'package:flutter/material.dart';

class PostulerScreen extends StatefulWidget {
  final String title;
  final String organisation;

  const PostulerScreen({
    super.key,
    required this.title,
    required this.organisation,
  });

  @override
  State<PostulerScreen> createState() => _PostulerScreenState();
}

class _PostulerScreenState extends State<PostulerScreen> {
  //-------------------------------------------------
  // Contrôleur de la lettre
  //-------------------------------------------------
  final TextEditingController lettreController = TextEditingController();

  //-------------------------------------------------
  // Nom du fichier sélectionné
  //-------------------------------------------------
  String cvName = "Aucun fichier choisi";

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
        centerTitle: true,

        title: const Text(
          "Postuler à l'offre",
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
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //-------------------------------------------------
            // CARTE DE L'OFFRE
            //-------------------------------------------------
            Card(
              elevation: 2,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF1B8F4D),

                      child: Icon(Icons.work, color: Colors.white),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            widget.organisation,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            //-------------------------------------------------
            // TITRE CV
            //-------------------------------------------------
            const Text(
              "CV",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            //-------------------------------------------------
            // SELECTION CV
            //-------------------------------------------------
            Container(
              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),

                border: Border.all(color: Colors.grey.shade300),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      cvName,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(
                      Icons.upload_file,
                      color: Color(0xFF1B8F4D),
                    ),
                    onPressed: () {
                      //-------------------------------------------------
                      // Plus tard :
                      // FilePicker pour PDF
                      //-------------------------------------------------
                      setState(() {
                        cvName = "Mon_CV.pdf";
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            //-------------------------------------------------
            // LETTRE
            //-------------------------------------------------
            const Text(
              "Lettre de motivation",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: lettreController,
              maxLines: 8,
              maxLength: 1000,

              decoration: InputDecoration(
                hintText: "Écrivez votre lettre de motivation...",

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            //-------------------------------------------------
            // BOUTON ENVOYER
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
                    const SnackBar(content: Text("Candidature envoyée !")),
                  );
                },

                child: const Text(
                  "Envoyer ma candidature",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------------------
            // MESSAGE
            //-------------------------------------------------
            const Center(
              child: Text(
                "Une seule candidature est autorisée pour cette offre.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
