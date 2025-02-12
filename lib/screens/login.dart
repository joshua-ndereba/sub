import 'package:flutter/material.dart';
import '../sevices/firebase_auth_service.dart';
import 'home_screen.dart';

class LoginScreen exteends State  {
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kwetu subscription", style: ,)
          ],
        )
      )
    );
  }
}