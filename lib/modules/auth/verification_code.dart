import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa servicios para usar TextInputFormatter

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/finanzasLogo.png', width: 200, height: 200),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Código de verificación',
                label: Text('Código de verificación'),
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.number,
              controller: _codeController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Solo permite números
              ],
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  String code = _codeController.text;
                  if (code.length < 6) {
                    // Si el código tiene menos de 6 dígitos, añade ceros al frente
                    code = code.padLeft(6, '0');
                  }

                  print('Código verificación: $code');

                  // Navega a la ruta '/resetPassword'
                  Navigator.pushNamed(context, '/resetPassword');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Validar código'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
