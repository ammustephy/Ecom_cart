import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocius_cart/Model/CartModel.dart';
import 'package:ocius_cart/bloc/cart_event.dart';
import 'package:ocius_cart/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    // Register event handlers
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  /// Handle adding product to cart
  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final updatedItems = List<CartItem>.from(state.items);
    final existingIndex = updatedItems.indexWhere(
          (item) => item.product.id == event.product.id,
    );

    if (existingIndex >= 0) {
      // Product already exists, increment quantity
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + 1,
      );
    } else {
      // Add new product to cart
      updatedItems.add(CartItem(product: event.product, quantity: 1));
    }

    emit(state.copyWith(items: updatedItems));
  }

  /// Handle removing product from cart
  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final updatedItems = state.items
        .where((item) => item.product.id != event.productId)
        .toList();
    emit(state.copyWith(items: updatedItems));
  }

  /// Handle updating product quantity
  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    if (event.quantity <= 0) {
      add(RemoveFromCart(event.productId));
      return;
    }

    final updatedItems = state.items.map((item) {
      if (item.product.id == event.productId) {
        return item.copyWith(quantity: event.quantity);
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }

  /// Handle clearing entire cart
  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartState());
  }
}