import 'package:finanzas_app/modules/auth/logout.dart';
import 'package:finanzas_app/modules/auth/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:finanzas_app/modules/auth/login.dart';
import 'package:finanzas_app/modules/auth/reset_password.dart';
import 'package:finanzas_app/modules/auth/send_email.dart';
import 'package:finanzas_app/modules/auth/verification_code.dart';
import 'package:finanzas_app/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/register': (context) => const Register(),
        '/logout': (context) => const Logout(),
        '/sendEmail': (context) => const SendEmail(),
        '/verificationCode': (context) => const VerificationCode(),
        '/resetPassword': (context) => const ResetPassword(),
      },
    );
  }
}
