import 'package:flutter/material.dart';

class SubscriptionTile extends StatelessWidget{
  final String? title;
  final String? price;
  final String? renewalDate;

  const SubscriptionTile({super.key, 
    this.title, 
    this.price,
    this.renewalDate,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ListTile(
        title: Text(title!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("price: $price | Renewal: $renewalDate"),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          //navigate to detail screen
        },
        minTileHeight: 200,
        
       
      
      )
    );
  }
}