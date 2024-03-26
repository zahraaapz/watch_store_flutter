part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}




final class CartLoadingState extends CartState {}


final class ReceivePayLinkState extends CartState {
  final String url;

  const ReceivePayLinkState(this.url);
}

final class CartInitialState extends CartState {}

final class CartCountState extends CartState {}

final class CartItemRemovedState extends CartState {
  final UserCart cartList;

  const CartItemRemovedState(this.cartList);
}

final class CartItemAddedState extends CartState {
  final UserCart cartList;

  const CartItemAddedState(this.cartList);
}

final class CartItemDeleted extends CartState {
  final UserCart cartList;

  const CartItemDeleted(this.cartList);
}

final class CartErrorState extends CartState {
  final String e;

  CartErrorState(this.e);
}

final class CartLoadedState extends CartState {
  final UserCart cartList;

  const CartLoadedState(this.cartList);
}
