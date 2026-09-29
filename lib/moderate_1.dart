import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product(this.name, this.price, this.imageUrl);
}

class Moderate1Screen extends StatelessWidget {
  const Moderate1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = List.generate(
      12,
      (index) => Product('Product ${index + 1}', (index + 1) * 10.0, 'https://via.placeholder.com/150'),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 1: Product Catalog')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              children: [
                Expanded(child: Image.network(product.imageUrl, fit: BoxFit.cover)),
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${product.price}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
