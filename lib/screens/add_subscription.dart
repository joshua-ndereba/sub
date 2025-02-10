import 'package:flutter/material.dart';
import 'package:sub/widgets/mytextfield.dart';

class AddSubscription extends StatefulWidget{
  @override
  _Addsubscriptionstate createState() => _Addsubscriptionstate();
  
  
}

class _Addsubscriptionstate extends State<AddSubscription>{
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Add subscrition")),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Mytextfield(hintText: "Subscription name ", controller: _namecontroller),
          SizedBox(height: 10,),
          Mytextfield(hintText: "Price", controller: _pricecontroller),
          SizedBox(height: 10,),
          Mytextfield(hintText: "renewal date", controller: _datecontroller),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {},
            child: Text("save subscription"),
          ),
        ],
      )
      )
    );
  }
}