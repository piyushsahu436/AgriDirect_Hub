import 'package:farmer22for/screens/homescreen/product.dart';
import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.product, required this.press})
      : super(key: key);

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    String productImage = product.image ?? 'placeholder_image.png'; // Provide a default image if product.image is null

    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        SizedBox(width: 50,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
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
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(productImage), // Use the handled productImage
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              // products is out demo list
              product.title ?? 'No Title', // Provide a default title if product.title is null
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
