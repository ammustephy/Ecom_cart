import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

/// Event to load all products
class LoadProducts extends ProductsEvent {}

/// Event to refresh products
class RefreshProducts extends ProductsEvent {}