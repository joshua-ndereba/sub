import 'package:flutter/material.dart';
import 'package:sub/screens/home_screen.dart';
import 'package:sub/screens/login.dart';
import '../sevices/firebase_auth_service.dart';

class Settings extends StatelessWidget{
  final FirebaseAuthService _authService = FirebaseAuthService();

  Settings({super.key});

  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: const Text("settings")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ElevatedButton(
                onPressed: () async {
                  await _authService.signout();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text("logout"),
                ),
            ],
          ),
        ),
      );
  }
}