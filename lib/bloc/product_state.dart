import 'package:equatable/equatable.dart';
import 'package:ocius_cart/Model/PoductModels.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

/// Initial state
class ProductsInitial extends ProductsState {}

/// Loading state
class ProductsLoading extends ProductsState {}

/// Success state with loaded products
class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

/// Error state
class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}