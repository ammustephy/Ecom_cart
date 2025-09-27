import 'package:equatable/equatable.dart';
import 'package:ocius_cart/Model/PoductModels.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

/// Event to add product to cart
class AddToCart extends CartEvent {
  final Product product;

  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

/// Event to remove product from cart
class RemoveFromCart extends CartEvent {
  final int productId;

  const RemoveFromCart(this.productId);

  @override
  List<Object> get props => [productId];
}

/// Event to update product quantity in cart
class UpdateQuantity extends CartEvent {
  final int productId;
  final int quantity;

  const UpdateQuantity(this.productId, this.quantity);

  @override
  List<Object> get props => [productId, quantity];
}

/// Event to clear entire cart
class ClearCart extends CartEvent {}