import 'package:flutter/foundation.dart';
import 'package:state_management/models/cart_items.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  Cart() {
    _items = {};
  }

  int get jumlah {
    return _items.length;
  }

  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.qty * cartItem.price;
    });
    return total;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      //Ketika key sudah ada di cart
      _items.update(
          productId,
          (value) => CartItem(
                id: value.id,
                title: value.title,
                price: value.price,
                qty: value.qty + 1,
              ));
    } else {
      //Menambahkan product baru
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: productId,
                title: title,
                price: price,
                qty: 1,
              ));
    }
    notifyListeners();
  }
}
