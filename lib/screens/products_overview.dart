import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
        ),
        body: ProductsGrid());
  }
}
