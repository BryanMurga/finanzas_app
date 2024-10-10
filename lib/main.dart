import 'package:finanzas_app/modules/auth/login.dart';
import 'package:finanzas_app/modules/auth/reset_password.dart';
import 'package:finanzas_app/modules/auth/send_email.dart';
import 'package:finanzas_app/modules/auth/verification_code.dart';
import 'package:finanzas_app/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/sendEmail': (context) => const SendEmail(),
        '/verificationCode': (context) => const VerificationCode(),
        '/resetPassword': (context) => const ResetPassword(),
      },
    );
  }
}
