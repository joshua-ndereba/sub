import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart';
import 'screens/login.dart';
import 'screens/subscription_details.dart';
import 'screens/add_subscription.dart';
import 'screens/settings.dart';
import 'sevices/firebase_auth_service.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp() as Widget);
  
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

 
  @override
  _MyAppState createState() => _MyAppState();
   
  
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final bool _isLoggedIn = false;
  @override
  void initState(){
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    bool isLoggedIn = await _authService.isLoggedIn();
    setState(() {
      isLoggedIn =isLoggedIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kwetu billing',
      debugShowCheckedModeBanner: false,
      home: _isLoggedIn? const HomeScreen(): LoginScreen(),
        
      //initialRoute: _isLoggedIn? Routes.dashboard: Routes.login,
      routes: Routes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ), 
        
    );
  }
}

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String dashboard = '/dashboard';

  static final routes = {
   dashboard: (context) => const HomeScreen(),
   login: (context) => LoginScreen(),
   //registration: (context) => HomeScreen(),
   //dashboard: (context) => HomeScreen(),
   //dashboard: (context) => HomeScreen(),
   
    
  };
}
