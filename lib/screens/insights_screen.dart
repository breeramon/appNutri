import 'package:flutter/material.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de insights estáticos
    final List<String> insights = [
      'Seu IMC está dentro da faixa saudável!',
      'Você atingiu 80% da sua meta de calorias gastas hoje.',
      'Continue registrando suas refeições para melhores recomendações.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('NutriAI', style: TextStyle(color: Theme.of(context).primaryColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          itemCount: insights.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return Card(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  insights[index],
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 