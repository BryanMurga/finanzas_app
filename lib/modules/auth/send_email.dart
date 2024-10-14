import 'package:flutter/material.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/finanzasLogo.png',
              width: 200,
              height: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0), // Espacio alrededor del avatar
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 30, // Ajusta el tamaño del avatar aquí
                    child: Text(
                      'BM', // Iniciales o texto dentro del avatar
                      style: TextStyle(color: Colors.white), // Color del texto
                    ),
                  ),
                  SizedBox(width: 8), // Espacio entre el avatar y el texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20203tn041@utez.edu.mx', // Correo
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Bryan Murga', // Nombre
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Contenido adicional en el centro
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 260.0), // Ajusta según la altura de la imagen
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // Imprime los valores ingresados
                        print('Email: ${_email.text}');
                        print('Contraseña: ${_password.text}');

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
          ),
        ],
      ),
    );
  }
}
