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
  final UserCart userCart;

  const CartItemRemovedState(this.userCart);
}

final class CartItemAddedState extends CartState {
  final UserCart userCart;

  const CartItemAddedState(this.userCart);
}

final class CartItemDeleted extends CartState {
  final UserCart userCart;

  const CartItemDeleted(this.userCart);
}

final class CartErrorState extends CartState {
  final String e;

  const CartErrorState(this.e);
}

final class CartLoadedState extends CartState {
  final UserCart userCart;

  const CartLoadedState(this.userCart);
}
