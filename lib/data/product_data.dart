import 'package:price_app/models/product_model.dart';

class ProductData {
  static final List<ProductModel> products = [
    ProductModel(
      name: 'Royal Feast Perfumed Rice (5kg)',
      imagePath: 'assets/jpeg/royal_feast_rice.jpg',
      category: 'GROCERIES',
      rating: 4.8,
      lowestPriceStore: 'Makola',
      price: '95.00',
      originalPrice: '',
    ),
    ProductModel(
      name: 'Samsung Galaxy A14 64GB',
      imagePath: 'assets/jpeg/samsung_galaxy.jpg',
      category: 'TECH',
      rating: 4.5,
      lowestPriceStore: 'CompuGhana',
      price: '1,800',
      originalPrice: '',
    ),
    ProductModel(
      name: 'Frytol Cooking Oil (1 Liter)',
      imagePath: 'assets/jpeg/frytol.jpeg',
      category: 'PANTRY',
      rating: 4.9,
      lowestPriceStore: 'Melcom',
      price: '25.00',
      originalPrice: '',
    ),
    ProductModel(
      name: 'iPhone 13 Pro (Refurbished)',
      imagePath: 'assets/jpeg/iphone13.jpeg',
      category: 'APPLE',
      rating: 5.0,
      lowestPriceStore: 'Franko',
      price: '6,500',
      originalPrice: '',
    ),
  ];
}
