import 'package:flutter/material.dart';
class best_selling extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  best_selling({required this.image, required this.title, required this.subtitle, required this.price});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0, 8, 8),
      child: Container(
        color: Colors.white,
        height: 80, // Set the desired height
        width: MediaQuery.of(context).size.width *1, // Set the desired width, 'double.infinity' to expand horizontally to fit its parent
        child: Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
                radius: 50,
                backgroundImage:
                AssetImage('${image}')),
            title: Text('${title}'),
            subtitle: Text('${subtitle}'),
            trailing: Text('${price}'),
          ),
        ),
      ),
    );
  }
}