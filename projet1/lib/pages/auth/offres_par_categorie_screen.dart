import 'package:flutter/material.dart';

class OffresParCategorieScreen extends StatelessWidget {
  final String categorie;

  const OffresParCategorieScreen({super.key, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categorie)),

      body: Center(
        child: Text(
          "Liste des offres : $categorie",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
