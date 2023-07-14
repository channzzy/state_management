// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: const [],
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Total : \$${cardData.totalHarga}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardData.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cardData.items.values.toList()[index].title),
                  subtitle: Text(
                      "Quantity: ${cardData.items.values.toList()[index].qty}"),
                  trailing: Container(
                    child: Text(
                      "\$ ${cardData.items.values.toList()[index].qty * cardData.items.values.toList()[index].price}",
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
