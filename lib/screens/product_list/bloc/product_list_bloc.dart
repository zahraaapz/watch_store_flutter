import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_flutter/data/model/product.dart';
import 'package:watch_store_flutter/data/repo/product_repo.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepo  iProductRepo;
  ProductListBloc(this.iProductRepo) : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
    if (event is ProductListInit) {
      try {
        emit(ProductListInitial());
        final productlist=await iProductRepo.getAllByCategory(event.param);
        emit(ProductListLoaded(productList: productlist));
      } catch (e) {
         emit(ProductListError());
      }
    }
    });
  }
}
