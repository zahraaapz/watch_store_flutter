part of 'product_single_bloc.dart';

sealed class ProductSingleState extends Equatable {
  const ProductSingleState();
  
  @override
  List<Object> get props => [];
}

final class ProductSingleLoading extends ProductSingleState {}
final class ProductSingleLoaded extends ProductSingleState {
  const ProductSingleLoaded( this.productDetailes);
  final ProductDetailes productDetailes;
}
final class ProductSingleError extends ProductSingleState {}
