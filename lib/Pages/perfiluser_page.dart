import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test1/Pages/login_page.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/providers/user_providers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userEmail = Provider.of<UsersProvider>(context).UserEmail;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/user.png',
                width: 200,
                height: 200,
              ),
              Text(
                'Bienvenido a Quick2Go: \n$userEmail',
                style: const TextStyle(fontFamily: 'Roboto', fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 8, backgroundColor: Colors.redAccent),
                onPressed: () {
                  Provider.of<UsersProvider>(context, listen: false)
                      .logoutUser();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text('Cerrar sesion'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
