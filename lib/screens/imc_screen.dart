import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String? _erro;

  void _calcularIMC() {
    final peso = double.tryParse(_pesoController.text.replaceAll(',', '.'));
    final altura = double.tryParse(_alturaController.text.replaceAll(',', '.'));
    if (peso == null || altura == null || peso <= 0 || altura <= 0) {
      setState(() {
        _erro = 'Por favor, preencha peso e altura corretamente.';
        _imc = null;
        _faixa = null;
      });
      return;
    }
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
      _erro = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              const TextSpan(text: 'Nutri'),
              TextSpan(text: 'AI', style: TextStyle(color: Theme.of(context).primaryColor)),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cálculo de IMC',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _pesoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              maxLength: 4,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9.,]{0,4}')),
              ],
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
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              maxLength: 4,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9.,]{0,4}')),
              ],
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
            if (_erro != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  _erro!,
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
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