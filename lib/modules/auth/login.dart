import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Asegúrate de importar Firebase Auth

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isObscure = true;

  void _navigateToForgotPassword() {
    Navigator.pushNamed(context, '/sendEmail');
  }

  Future<void> _signInUser() async {
    String emailAddress = _email.text.trim();
    String password = _password.text.trim();

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // Inicio de sesión exitoso, navega a la pantalla de logout
      Navigator.pushReplacementNamed(context, '/logout');
      print('Usuario iniciado sesión: ${credential.user?.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No se encontró un usuario con ese correo electrónico.');
      } else if (e.code == 'wrong-password') {
        print('Contraseña incorrecta proporcionada para ese usuario.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _navigateToRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/finanzasLogo.png', width: 200, height: 200),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Correo electrónico',
                    label: Text('Correo electrónico'),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: Text('Contraseña'),
                    labelStyle: TextStyle(color: Colors.black),
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
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      _signInUser(); // Llama a la función de inicio de sesión
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Iniciar sesión'), // Texto del botón
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _navigateToForgotPassword,
                  child: const Text(
                    'Recuperar Contraseña',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          // Botón pequeño en la esquina superior derecha
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Margen del botón
              child: SizedBox(
                width: 100, // Ajusta el tamaño del botón
                height: 40, // Ajusta el tamaño del botón
                child: ElevatedButton(
                  onPressed:
                      _navigateToRegister, // Navega a la vista de registro
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .green, // Mismo color verde que el botón de inicio de sesión
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16), // Mismo estilo de bordes redondeados
                    ),
                  ),
                  child: const Text(
                    'Registrar',
                    style: TextStyle(
                        color: Colors.white, fontSize: 12), // Texto pequeño
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
