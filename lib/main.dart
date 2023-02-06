import 'package:flutter/material.dart';
import 'package:flutter_auth/services/google_signin_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Auth Google - Apple'),
            actions: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.doorOpen),
                onPressed: () {
                  GoogleSignInService.signOutGoogle();
                },
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const Text('Bienvenido'),
              const SizedBox(height: 20),
              const Text('Inicia sesión con tu cuenta de Google o Apple'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  GoogleSignInService.singInWithGoogle();
                },
                icon: const Icon(FontAwesomeIcons.google),
                label: const Text('Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shadowColor: Colors.grey,
                  elevation: 5,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.apple),
                label: const Text('Apple'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: Colors.grey,
                  elevation: 5,
                ),
              ),
            ]),
          )),
    );
  }
}
