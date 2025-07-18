import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('NutriAI', style: TextStyle(color: Theme.of(context).primaryColor)),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCard(
              child: ListTile(
                title: const Text('Calcular IMC', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushNamed('/imc');
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomCard(
              child: ListTile(
                title: const Text('Calorias Gastas', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushNamed('/calorias_gastas');
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomCard(
              child: ListTile(
                title: const Text('Calorias Ingeridas', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushNamed('/calorias_ingeridas');
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomCard(
              child: ListTile(
                title: const Text('Insights de Saúde', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushNamed('/insights');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 