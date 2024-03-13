import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_flutter/data/repo/product_repo.dart';

import '../../../data/model/product_detail.dart';

part 'product_single_event.dart';
part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final IProductRepo _iProductRepo;
  ProductSingleBloc(this._iProductRepo) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {
   if (event is ProductSingleInit) {
    try {
      emit(ProductSingleLoading());
      final productDetailes=await _iProductRepo.getproductDetail(event.id);
      emit(ProductSingleLoaded(productDetailes));
      print('ll');
    } catch (e) {
       emit(ProductSingleError());
    }
     
   }
    });
  }
}
