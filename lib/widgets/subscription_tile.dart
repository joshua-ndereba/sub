import 'package:flutter/material.dart';

class SubscriptionTile extends StatelessWidget{
  final String? title;
  final String? price;
  final String? renewalDate;

  SubscriptionTile({
    this.title, 
    this.price,
    this.renewalDate,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(title!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("price: $price | Renewal: $renewalDate"),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          //navigate to detail screen
        }
      )
    );
  }
}