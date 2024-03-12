part of 'product_list_bloc.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();
  
  @override
  List<Object> get props => [];
}

final class ProductListInitial extends ProductListState {}
final class ProductListError extends ProductListState {}
final class ProductListLoaded extends ProductListState {
  final List<Product>productList;

  const ProductListLoaded({required this.productList});
}
