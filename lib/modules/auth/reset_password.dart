import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  bool _isObscure = true;
  String _errorMessage = ''; // Variable para almacenar el mensaje de error

  void _navigateToLogin() {
    Navigator.pushNamed(context, '/login');
  }

  void _validateAndSavePassword() {
    // Verifica si los campos están vacíos
    if (_password.text.isEmpty || _repeatPassword.text.isEmpty) {
      setState(() {
        _errorMessage = 'Debe establecer una contraseña válida';
      });
    }
    // Verifica si las contraseñas coinciden
    else if (_password.text != _repeatPassword.text) {
      setState(() {
        _errorMessage = 'Las contraseñas no coinciden';
      });
    }
    // Si todo es válido, redirige al login
    else {
      _navigateToLogin();
    }
  }

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
              decoration: InputDecoration(
                hintText: 'Contraseña',
                label: const Text('Contraseña'),
                labelStyle: const TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              controller: _password,
              obscureText: _isObscure,
            ),  
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Repetir Contraseña',
                label: const Text('Repetir Contraseña'),
                labelStyle: const TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              controller: _repeatPassword,
              obscureText: _isObscure,
            ),
            const SizedBox(height: 16),
            // Muestra el mensaje de error si existe alguno
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed:
                    _validateAndSavePassword, // Valida al presionar el botón
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
