part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartLoadingState extends CartState {}

final class CartInitialState extends CartState {}

final class CartCountState extends CartState {}

final class CartItemRemovedState extends CartState {
  final List<CartModel> cartList;

  const CartItemRemovedState(this.cartList);
}

final class CartItemAddedState extends CartState {
  final List<CartModel> cartList;

  const CartItemAddedState(this.cartList);
}

final class CartItemDeleted extends CartState {
  final List<CartModel> cartList;

  const CartItemDeleted(this.cartList);
}

final class CartErrorState extends CartState {}

final class CartLoadedState extends CartState {
  final List<CartModel> cartList;

  const CartLoadedState(this.cartList);
}
