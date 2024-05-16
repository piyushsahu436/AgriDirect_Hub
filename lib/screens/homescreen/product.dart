import 'package:flutter/material.dart';

class Product {
  final String? image, title, description;
  final int? price, size, id;
  final Color? color;

  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Nature Plus",
    price: 234,
    size: 11,
    description: "dummyText",
    image: "assets/images/images1.png",
    color: Color(0xFF6B398)
    ,),
  Product(
      id: 2,
      title: "Organic Manure",
      price: 234,
      size: 12,
      description: "dummyText",
      image: "assets/images/images2.png",
      color: Color(0xFF6B398)),
  Product(
      id: 3,
      title: "Nutrient Mixture",
      price: 234,
      size: 11,
      description: "dummyText",
      image: "assets/images/images3.png",
      color: Color(0xFF6B398)),
  Product(
      id: 4,
      title: "Urea Bag",
      price: 234,
      size: 11,
      description: "images4",
      image: "assets/images/images4.png",
      color: Color(0xFF6B398)),

  Product(
      id: 5,
      title: "Neem Liquid",
      price: 234,
      size: 11,
      description: "images4",
      image: "assets/images/images5.png",
      color: Color(0xFF6B398)),


];
