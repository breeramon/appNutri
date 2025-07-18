import 'package:flutter/material.dart';

class CaloriesIntakeScreen extends StatefulWidget {
  const CaloriesIntakeScreen({super.key});

  @override
  State<CaloriesIntakeScreen> createState() => _CaloriesIntakeScreenState();
}

class _CaloriesIntakeScreenState extends State<CaloriesIntakeScreen> {
  final TextEditingController _mealController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final List<Map<String, dynamic>> _meals = [];

  void _addMeal() {
    final meal = _mealController.text.trim();
    final calories = double.tryParse(_caloriesController.text.replaceAll(',', '.'));
    if (meal.isNotEmpty && calories != null) {
      setState(() {
        _meals.add({'meal': meal, 'calories': calories});
        _mealController.clear();
        _caloriesController.clear();
      });
    }
  }

  double get _totalCalories => _meals.fold(0, (sum, item) => sum + (item['calories'] as double));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NutriAI', style: TextStyle(color: Theme.of(context).primaryColor)),
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
              controller: _mealController,
              decoration: InputDecoration(
                labelText: 'Refeição',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _caloriesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Calorias (kcal)',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addMeal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Adicionar'),
            ),
            const SizedBox(height: 32),
            Text(
              'Total ingerido: ${_totalCalories.toStringAsFixed(0)} kcal',
              style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  final meal = _meals[index];
                  return ListTile(
                    title: Text(meal['meal'], style: const TextStyle(color: Colors.white)),
                    trailing: Text('${meal['calories'].toStringAsFixed(0)} kcal', style: TextStyle(color: Theme.of(context).primaryColor)),
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