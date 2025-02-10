import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart';
import 'screens/subscription_details.dart';
import 'screens/add_subscription.dart';
import 'screens/settings.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
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
    AddSubscription();
    settings_screen();
  ];

  void _onItemTapped(int index){
    setState(() {
      _SelectedIndex = index;}

    );
  }

  @override
  Widget build(BuildContext sontext) {
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
