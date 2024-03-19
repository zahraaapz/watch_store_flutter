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
        }
        
         else if (event is RemoveFromCartEvent) {
          emit(CartLoadingState());

          await _iCartRepository
              .removeFromCart(productId: event.productId)
              .then((value) => emit(CartItemRemovedState(value)));
        } 
        
        else if (event is DeleteFromCartEvent) {
          emit(CartLoadingState());

          await _iCartRepository
              .deleteFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeleted(value)));
        } 
        
        else if (event is AddToCartEvent) {
          emit(CartLoadingState());
          await _iCartRepository
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedState(value)));
        }
        
         else if (event is CartItemCountEvent) {
          await _iCartRepository
              .countCartItem()
              .then((value) => emit(CartCountState()));
        }
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}
