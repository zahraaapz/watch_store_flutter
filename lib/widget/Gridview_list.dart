import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_flutter/screens/product_list/bloc/product_list_bloc.dart';
import 'package:watch_store_flutter/widget/product_item.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
     
      builder: (context, state) {
     
        if (state is  ProductListInitial) {
          return const Center(child: CircularProgressIndicator(),);
        }
        else if (state is ProductListLoaded) {
              return Expanded(
          child: GridView.builder(
            itemCount: state.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.5,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              
              return productItem(
                  productName: state.productList[index].title,
                   price: state.productList[index].price,
                  imagePath: state.productList[index].image,
                  oldPrice: state.productList[index].discountPrice,
                  discount: state.productList[index].discount,
                  specialExpiration: state.productList[index].specialExpiration,
                  );
            },
          ),
        );
        }
    else{
      return throw Exception('Error');
    }
      },
    );
  }
}
