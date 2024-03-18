import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
import 'package:watch_store_flutter/data/repo/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _iCartRepository;
  CartBloc(this._iCartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitEvent) {
          emit(CartLoadingState());
          final cartlist = await _iCartRepository.getUserCart();
          emit(CartLoadedState(cartlist));
        } else if (event is RemoveFromCartEvent) {
          await _iCartRepository
              .removeFromCart(productId: event.productId)
              .then((value) => emit(CartItemRemovedState()));
        } else if (event is DeleteFromCartEvent) {
          await _iCartRepository
              .deleteFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeletedState()));
        } else if (event is AddToCartEvent) {
          emit(CartLoadingState());
           await _iCartRepository
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedState()));
        }
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}