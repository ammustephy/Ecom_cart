import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocius_cart/ApiServices.dart';
import 'package:ocius_cart/bloc/product_event.dart';
import 'package:ocius_cart/bloc/product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiService apiService;

  ProductsBloc({required this.apiService}) : super(ProductsInitial()) {
    // Register event handlers
    on<LoadProducts>(_onLoadProducts);
    on<RefreshProducts>(_onRefreshProducts);
  }

  /// Handle loading products event
  Future<void> _onLoadProducts(
      LoadProducts event,
      Emitter<ProductsState> emit,
      ) async {
    emit(ProductsLoading());
    try {
      final products = await apiService.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  /// Handle refreshing products event
  Future<void> _onRefreshProducts(
      RefreshProducts event,
      Emitter<ProductsState> emit,
      ) async {
    try {
      final products = await apiService.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}