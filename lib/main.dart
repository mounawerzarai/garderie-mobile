import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MaGarderieApp());

class MaGarderieApp extends StatelessWidget {
  const MaGarderieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Garderie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/garderie.png',
              width: 220,
              height: 220,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.child_care, size: 160, color: Colors.orange),
            ),
            const SizedBox(height: 24),
            const Text(
              'Ma Garderie',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
const List<Map<String, dynamic>> activites = [
  {
    "id": 1,
    "titre": "Dessin et coloriage",
    "description": "Développement de la créativité",
    "icone": "🎨"
  },
  {
    "id": 2,
    "titre": "Jeux éducatifs",
    "description": "Apprentissage par le jeu",
    "icone": "🧩"
  },
  {
    "id": 3,
    "titre": "Musique et chansons",
    "description": "Éveil musical des enfants",
    "icone": "🎵"
  },
  {
    "id": 4,
    "titre": "Lecture de contes",
    "description": "Découverte des histoires",
    "icone": "📚"
  },
  {
    "id": 5,
    "titre": "Activités sportives",
    "description": "Développement de la motricité",
    "icone": "⚽"
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ma Garderie')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Ma Garderie',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.local_activity),
              title: const Text('Activités'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              onTap: () {},
            ),
          ],
        ),
      ),
            body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: activites.length,
        itemBuilder: (context, index) {
          final a = activites[index];
          return Card(
            child: ListTile(
              leading: Text(a['icone'], style: const TextStyle(fontSize: 32)),
              title: Text(a['titre']),
              subtitle: Text(a['description']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}