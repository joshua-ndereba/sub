import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text("settings")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ElevatedButton(
                onPressed: () {},
                child: Text("logout"),
                ),
            ],
          ),
        ),
      );
  }
}