import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart.dart';
import 'package:state_management/screens/cart_screen.dart';
import 'package:state_management/widgets/badge.dart';

import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return CustomBadge(
                value: value.jumlah.toString(),
                child: ch!,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_bag),
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
