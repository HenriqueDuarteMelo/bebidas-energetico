import 'package:flutter/material.dart';

class MonsterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monster'), backgroundColor: Colors.green),
      backgroundColor: const Color.fromARGB(255, 197, 243, 199),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // só o espaço necessário
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Recicle com Monster!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/monster.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, // texto preto
                  backgroundColor: const Color.fromARGB(
                    255,
                    54,
                    247,
                    28,
                  ), // botão claro para contraste
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EnergeticoMonsterScreen(),
                    ),
                  );
                },
                child: Text('Energético Monster'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, // texto preto
                  backgroundColor: const Color.fromARGB(255, 224, 72, 72),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EnergeticoGenericoScreen(),
                    ),
                  );
                },
                child: Text('Energético Genérico'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Energético Monster
class EnergeticoMonsterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Energético Monster'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Obrigado por estar consumindo Monster!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/monster.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 24),
              Text(
                'Consumindo Monster, você recicla mais do que energia!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Energético Genérico
class EnergeticoGenericoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text('Energético Genérico'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close, color: Colors.red[900], size: 150),
              SizedBox(height: 24),
              Text(
                'Ops! Dá uma chance pro Monster e vem com a gente na reciclagem.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
