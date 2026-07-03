import 'package:flutter/material.dart';

class GestionUtilisateursScreen extends StatefulWidget {
  const GestionUtilisateursScreen({super.key});

  @override
  State<GestionUtilisateursScreen> createState() =>
      _GestionUtilisateursScreenState();
}

class _GestionUtilisateursScreenState extends State<GestionUtilisateursScreen> {
  //-------------------------------------------------
  // Recherche
  //-------------------------------------------------
  String searchText = "";

  //-------------------------------------------------
  // Données temporaires
  //-------------------------------------------------
  List<Map<String, dynamic>> users = [
    {"name": "Aïcha Diarra", "email": "aicha@gmail.com", "active": true},
    {"name": "Mohamed Traoré", "email": "mohamed@gmail.com", "active": false},
  ];

  //-------------------------------------------------
  // ACTIVER / DESACTIVER
  //-------------------------------------------------
  void toggleUser(int index) {
    setState(() {
      users[index]["active"] = !users[index]["active"];
    });
  }

  //-------------------------------------------------
  // SUPPRIMER
  //-------------------------------------------------
  void deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  //-------------------------------------------------
  // FILTRAGE
  //-------------------------------------------------
  List<Map<String, dynamic>> get filteredUsers {
    return users.where((user) {
      return user["name"].toLowerCase().contains(searchText.toLowerCase()) ||
          user["email"].toLowerCase().contains(searchText.toLowerCase());
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
        title: const Text(
          "Gestion des Utilisateurs",
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
            // SEARCH
            //-------------------------------------------------
            TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Rechercher un utilisateur...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            //-------------------------------------------------
            // LISTE
            //-------------------------------------------------
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF1B8F4D),
                        child: Text(
                          user["name"][0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      title: Text(
                        user["name"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      subtitle: Text(user["email"]),

                      //-------------------------------------------------
                      // STATUS
                      //-------------------------------------------------
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: user["active"] ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              user["active"] ? "Actif" : "Bloqué",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          IconButton(
                            icon: Icon(
                              user["active"] ? Icons.block : Icons.check,
                            ),
                            onPressed: () {
                              toggleUser(index);
                            },
                          ),

                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              deleteUser(index);
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
