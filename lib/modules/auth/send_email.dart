import 'package:flutter/material.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0), // Espaciado lateral
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo centrado
            Center(
              child: Image.asset(
                'assets/finanzasLogo.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 32), // Espacio entre el logo y el input
            // Campo de correo electrónico
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Correo electrónico',
                label: Text('Correo electrónico'),
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
            ),
            const SizedBox(height: 48), // Espacio entre el input y el botón
            // Botón de envío
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // Imprime los valores ingresados
                  print('Email: ${_email.text}');
                  // Navega a la ruta '/verificationCode'
                  Navigator.pushNamed(context, '/verificationCode');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Enviar código'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
