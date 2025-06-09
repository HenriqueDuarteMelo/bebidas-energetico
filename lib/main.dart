import 'package:flutter/material.dart';
import 'package:bebidaenergetico/pages/monster.dart';
import 'package:bebidaenergetico/pages/shark.dart';
import 'package:bebidaenergetico/pages/xequemate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escolha sua Bebida',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/monster': (context) => MonsterScreen(),
        '/shark': (context) => SharkScreen(),
        '/xequemate': (context) => XequeMateScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, bool> _isPressed = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha Sua Bebida'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildOptionCard(
              context,
              title: 'Monster',
              description: 'Energia para enfrentar qualquer desafio.',
              imagePath: 'assets/monster.png',
              route: '/monster',
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              context,
              title: 'Shark',
              description: 'Sinta o poder das profundezas.',
              imagePath: 'assets/shark.png',
              route: '/shark',
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              context,
              title: 'Xeque Mate',
              description: 'A jogada que muda tudo.',
              imagePath: 'assets/xequemate.png',
              route: '/xequemate',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imagePath,
    required String route,
  }) {
    _isPressed.putIfAbsent(
      title,
      () => false,
    ); // Inicializa o estado, se necessário

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed[title] = true;
        });
      },
      onTapUp: (_) async {
        await Future.delayed(const Duration(milliseconds: 150));
        setState(() {
          _isPressed[title] = false;
        });
        Navigator.pushNamed(context, route);
      },
      onTapCancel: () {
        setState(() {
          _isPressed[title] = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        transform: _isPressed[title] == true
            ? (Matrix4.identity()
                ..translate(0, -5)
                ..scale(0.97))
            : Matrix4.identity(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: _isPressed[title] == true ? 8 : 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
