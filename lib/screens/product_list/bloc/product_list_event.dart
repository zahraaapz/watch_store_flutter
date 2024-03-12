part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}
 
 final class ProductListInit extends ProductListEvent{
 const ProductListInit({required this.param});

  final param;
 }
