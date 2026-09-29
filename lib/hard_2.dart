import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final String id;
  final String name;
  final double price;
  Product(this.id, this.name, this.price);
}

class CartItem {
  final Product product;
  int quantity;
  CartItem(this.product, this.quantity);
}

class EcomProvider extends ChangeNotifier {
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  void addToCart(Product p) {
    int index = _cart.indexWhere((item) => item.product.id == p.id);
    if (index >= 0) {
      _cart[index].quantity++;
    } else {
      _cart.add(CartItem(p, 1));
    }
    notifyListeners();
  }

  double get total => _cart.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}

class Hard2App extends StatelessWidget {
  const Hard2App({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EcomProvider(),
      child: MaterialApp(
        home: const ProductListScreen(),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final products = [Product('1', 'Laptop', 999), Product('2', 'Phone', 599), Product('3', 'Watch', 199)];
    return Scaffold(
      appBar: AppBar(title: const Text('Products'), actions: [
        IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())))
      ]),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, i) => Card(
          child: Column(
            children: [
              Text(products[i].name),
              Text('\$${products[i].price}'),
              ElevatedButton(onPressed: () => context.read<EcomProvider>().addToCart(products[i]), child: const Text('Add to Cart'))
            ],
          ),
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<EcomProvider>(
        builder: (context, ecom, _) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ecom.cart.length,
                itemBuilder: (context, i) => ListTile(
                  title: Text(ecom.cart[i].product.name),
                  subtitle: Text('Qty: ${ecom.cart[i].quantity}'),
                ),
              ),
            ),
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen())), child: const Text('Checkout'))
          ],
        ),
      ),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final total = context.watch<EcomProvider>().total;
    return Scaffold(appBar: AppBar(title: const Text('Summary')), body: Center(child: Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24))));
  }
}
