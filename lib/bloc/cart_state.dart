import 'package:equatable/equatable.dart';
import 'package:ocius_cart/Model/CartModel.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  /// Get total number of items in cart
  int get totalItems => items.fold(0, (total, item) => total + item.quantity);

  /// Get total price of all items in cart
  double get totalPrice => items.fold(0, (total, item) => total + item.totalPrice);

  /// Check if cart is empty
  bool get isEmpty => items.isEmpty;

  /// Create a copy of state with updated items
  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}