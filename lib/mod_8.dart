import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String name;
  final double price;
  CartItem(this.name, this.price);
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}

class Moderate8Screen extends StatelessWidget {
  const Moderate8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Mod 8: Shopping Cart Provider')),
        body: Column(
          children: [
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$${item.price}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () => cart.removeItem(index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<CartProvider>(
              builder: (context, cart, child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addItem(CartItem('Sample Product', 19.99));
                    },
                    child: const Text('Add Item (\$19.99)'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
