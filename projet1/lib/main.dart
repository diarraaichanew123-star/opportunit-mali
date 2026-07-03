import 'package:flutter/material.dart';
import 'package:projet1/pages/admin/dashboard_admin.dart';
import 'package:projet1/pages/admin/gestionCategorie_admin.dart';
import 'package:projet1/pages/admin/gestionOffres_admin.dart';
import 'package:projet1/pages/admin/gestionUtilisateur_admin.dart';
import 'package:projet1/pages/admin/login_admin.dart';
import 'package:projet1/pages/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Opportunités Mali',
      home: const SplashScreen(),
    );
  }
}
