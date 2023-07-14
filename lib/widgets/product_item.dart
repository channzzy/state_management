import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart.dart';
import 'package:state_management/providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) {
              return IconButton(
                icon: (productData.isFavorite)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
                color: Theme.of(context).hintColor,
                onPressed: () {
                  productData.statusFav();
                },
              );
            },
          ),
          title: Text(
            productData.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Berhasil Di Tambahkan'),
                duration: Duration(milliseconds: 500),
              ));
              cart.addCart(
                productData.id!,
                productData.title!,
                productData.price!,
              );
            },
            color: Theme.of(context).hintColor,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
