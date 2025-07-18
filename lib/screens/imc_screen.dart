import 'package:flutter/material.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  State<ImcScreen> createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double? _imc;
  String? _faixa;

  void _calcularIMC() {
    final peso = double.tryParse(_pesoController.text.replaceAll(',', '.'));
    final altura = double.tryParse(_alturaController.text.replaceAll(',', '.'));
    if (peso != null && altura != null && altura > 0) {
      final imc = peso / (altura * altura);
      String faixa;
      if (imc < 18.5) {
        faixa = 'Abaixo do peso';
      } else if (imc < 25) {
        faixa = 'Normal';
      } else if (imc < 30) {
        faixa = 'Sobrepeso';
      } else {
        faixa = 'Obesidade';
      }
      setState(() {
        _imc = imc;
        _faixa = faixa;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular IMC'),
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
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calcularIMC,
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
            if (_imc != null && _faixa != null)
              Column(
                children: [
                  Text(
                    'Seu IMC: ${_imc!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _faixa!,
                    style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
} 