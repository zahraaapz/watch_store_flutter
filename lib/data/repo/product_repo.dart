import '../model/product.dart';
import '../src/product_data_src.dart';


abstract class IProductRepo {

  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);


}


class ProductRepository implements IProductRepo{

 final IProductDataSrc  iProductDataSrc;
 ProductRepository(this.iProductDataSrc);
  


  
  @override
  Future<List<Product>> getAllByBrand(int id) => iProductDataSrc.getAllByBrand(id);
  
  @override
  Future<List<Product>> getAllByCategory(int id) => iProductDataSrc.getAllByCategory(id);
  
  @override
  Future<List<Product>> getSorted(String routeParam) =>iProductDataSrc.getSorted(routeParam);
  
  @override
  Future<List<Product>> searchProducts(String searchKey)=>iProductDataSrc.searchProducts(searchKey);



}