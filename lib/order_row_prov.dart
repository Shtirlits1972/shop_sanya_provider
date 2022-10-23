import 'package:flutter/material.dart';
import 'package:shop_sanya/order_row.dart';
import 'package:shop_sanya/product.dart';

class OrderRowProv with ChangeNotifier {
  List<OrderRow> _rows = [];

  bool isEmpty() {
    bool empty = true;
    if (_rows.length > 0) {
      empty = false;
    } else {
      empty = true;
    }
    return empty;
  }

  List<OrderRow> getOrderRow() {
    return _rows;
  }

  double total() {
    double order_price = 0;

    for (int i = 0; i < _rows.length; i++) {
      order_price += (_rows[i].qty * _rows[i].ProductPrice);
    }
    return order_price;
  }

  removeById(int id) {
    for (int i = 0; i < _rows.length; i++) {
      if (_rows[i].ProductId == id) {
        _rows.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

  clear() {
    _rows.clear();
    notifyListeners();
  }

  addRow(Product prod, int qty) {
    OrderRow row =
        OrderRow(prod.id, prod.productName, prod.price, prod.pictures, qty);
    bool flag = false;
    for (int i = 0; i < _rows.length; i++) {
      if (_rows[i].ProductId == row.ProductId) {
        _rows[i].qty += row.qty;
        flag = true;
        if (_rows[i].qty < 1) {
          removeById(_rows[i].ProductId);
        }
        break;
      }
    }

    if (flag == false) {
      _rows.add(row);
    }
    notifyListeners();
  }
}
