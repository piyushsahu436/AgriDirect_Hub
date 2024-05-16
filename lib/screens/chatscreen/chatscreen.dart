import 'package:flutter/material.dart';


class Farmer {
  final String name;
  final String category;
  final double quantity;
  final double pricePerKg;
  final String location;

  Farmer({
    required this.name,
    required this.category,
    required this.quantity,
    required this.pricePerKg,
    required this.location,
  });
}

class Farmerdetails extends StatelessWidget {
  final List<Farmer> farmers = [
    Farmer(
      name: 'Ramesh Kumar',
      category: 'Tomatoes',
      quantity: 100.0,
      pricePerKg: 2.5,
      location: 'kharuti , attra banda',
    ),
    Farmer(
      name: 'Suresh Kumar',
      category: 'Potato',
      quantity: 200.0,
      pricePerKg: 3.0,
      location: 'Rampur , attra railway road banda',
    ),
    Farmer(
      name: 'Naveen ',
      category: 'Oranges',
      quantity: 150.0,
      pricePerKg: 2.0,
      location: 'Sunshine Farm , attra banda',
    ),
    Farmer(
      name: 'Swati ',
      category: 'Spinach',
      quantity: 150.0,
      pricePerKg: 2.0,
      location: 'Sunshine Farm , attra banda',
    ),
    Farmer(
      name: 'Ayush ',
      category: 'Broccoli',
      quantity: 150.0,
      pricePerKg: 2.0,
      location: 'Sunshine Farm , attra banda',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Details of Farmers ' , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ),),
        ),
        body: ListView.builder(
          itemCount: farmers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(farmers[index].name),
              subtitle: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,10),
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,

                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category: ${farmers[index].category}'),
                    Text('Quantity: ${farmers[index].quantity} kg'),
                    Text('Price per kg: \$${farmers[index].pricePerKg}'),
                    Text('Location: ${farmers[index].location}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
