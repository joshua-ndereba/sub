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
  runApp(MyApp() as Widget);
  
}

class MyApp extends StatelessWidget {
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kwetu billing',
      debugShowCheckedModeBanner: false,
      //home: _authService.getCurrentUser() == null ? LoginScreen() : HomeScreen(),
      home: StreamBuilder(
        stream: _authService.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
  switch (snapshot.connectionState) {
    case ConnectionState.active:
      User? user = snapshot.data;
      return user != null ? MainScreen() : LoginScreen();
    case ConnectionState.waiting:  
      return const Center(child: CircularProgressIndicator());
    case ConnectionState.done:     
      return const Center(child: Text("Done")); 
   
    default:                     
      return const Center(child: Text("Unknown State"));
  }
},
        /*
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active){
            User? user = snapshot.data;
            return user != null ? MainScreen() : LoginScreen();
          } 
        },*/
        ),
      //initialRoute: Routes.dashboard,
      routes: Routes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
        
    );
  }
}

class MainScreen extends StatefulWidget{
  
  @override
  _MainScreenState createState() => _MainScreenState();
  
 
  
}

class _MainScreenState extends State<MainScreen>{
  int _SelectedIndex = 0;

  static List<Widget> _widgetoptions = <Widget>[
    HomeScreen(),
    AddSubscription(),
    Settings(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _SelectedIndex = index;}

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _widgetoptions.elementAt(_SelectedIndex),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),

      ],
      currentIndex: _SelectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
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
   dashboard: (context) => HomeScreen(),
    
  };
}
