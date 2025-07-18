import 'package:flutter/material.dart';

class CaloriesBurnedScreen extends StatefulWidget {
  const CaloriesBurnedScreen({super.key});

  @override
  State<CaloriesBurnedScreen> createState() => _CaloriesBurnedScreenState();
}

class _CaloriesBurnedScreenState extends State<CaloriesBurnedScreen> {
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  double? _calorias;

  void _calcularCalorias() {
    final duration = double.tryParse(_durationController.text.replaceAll(',', '.'));
    if (duration != null && duration > 0) {
      // Exemplo: 8 kcal/minuto
      final calorias = duration * 8;
      setState(() {
        _calorias = calorias;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorias Gastas'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _activityController,
              decoration: InputDecoration(
                labelText: 'Atividade',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Duração (min)',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calcularCalorias,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 32),
            if (_calorias != null)
              Column(
                children: [
                  Text(
                    'Calorias gastas: ${_calorias!.toStringAsFixed(0)} kcal',
                    style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
} 