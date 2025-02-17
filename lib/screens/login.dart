import 'package:flutter/material.dart';
import '../sevices/firebase_auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget  {
  final FirebaseAuthService _authService = FirebaseAuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Kwetu subscription", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () async {
              var user = await _authService.signinWithGoogle();
              if (user != null){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            }, child: const Text("Sign in with Google"),
            ),
          ],
        )
      )
    );
  }
}