import 'package:equatable/equatable.dart';
import 'package:ocius_cart/Model/PoductModels.dart';

class CartItem extends Equatable {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  /// Calculate total price for this cart item
  double get totalPrice => product.price * quantity;

  /// Create a copy of cart item with updated quantity
  CartItem copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [product, quantity];
}