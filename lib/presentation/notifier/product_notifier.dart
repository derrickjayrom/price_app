import 'package:flutter/material.dart';
import 'package:price_app/models/product_model.dart';

class ProductNotifier extends ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
      name: 'Royal Feast Perfumed Rice (5kg)',
      imagePath: 'assets/jpeg/melcom.jpeg', // Using melcom.jpeg as placeholder
      category: 'GROCERIES',
      rating: 4.8,
      lowestPriceStore: 'Makola',
      price: '95.00',
      originalPrice: '',
    ),
    ProductModel(
      name: 'Samsung Galaxy A14 64GB',
      imagePath:
          'assets/jpeg/compu_gh.jpeg', // Using compu_gh.jpeg as placeholder
      category: 'TECH',
      rating: 4.5,
      lowestPriceStore: 'CompuGhana',
      price: '1,800',
      originalPrice: '',
    ),
    ProductModel(
      name: 'Frytol Cooking Oil (1 Liter)',
      imagePath: 'assets/jpeg/melcom.jpeg',
      category: 'PANTRY',
      rating: 4.9,
      lowestPriceStore: 'Melcom',
      price: '25.00',
      originalPrice: '',
    ),
    ProductModel(
      name: 'iPhone 13 Pro (Refurbished)',
      imagePath: 'assets/jpeg/compu_gh.jpeg',
      category: 'APPLE',
      rating: 5.0,
      lowestPriceStore: 'Franko',
      price: '6,500',
      originalPrice: '',
    ),
  ];

  List<ProductModel> get products => _products;
}
