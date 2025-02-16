import 'package:flutter/material.dart';
import 'package:sub/screens/add_subscription.dart';
import 'package:sub/screens/settings.dart';
import 'package:sub/widgets/bottomnavigationbr.dart';
import '../widgets/subscription_tile.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("subscriptions")),
      body: ListView(
        children:
         [
          SubscriptionTile(
            title: "3mbs",
            price: "\ksh1000",
            renewalDate: "feb 20"
          ),
          SubscriptionTile(
            title: "6mbs",
            price: "\ksh1500",
            renewalDate: "feb 20"
          ),
          SubscriptionTile(
            title: "10mbs",
            price: "\ksh2000",
            renewalDate: "feb 20"
          ),
          SubscriptionTile(
            title: "15mbs",
            price: "\ksh2500",
            renewalDate: "feb 20"
          ),
          
        ]
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        screens: [
          HomeScreen(),
          AddSubscription(),
          Settings(),
        ],
      )
      );
  }
}