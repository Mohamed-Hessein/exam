import 'package:dio/dio.dart';
import 'package:exam/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_model.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit():super(ProductGetIniatal());   List<product> productListCart  = [];

  Dio dio =Dio();
  bool isCLick = false;
  List<product> productList  = [];Future<void> getProudct() async {
    emit(ProductGetLoading());

    try {
      Response response =
      await dio.get('https://www.jsonkeeper.com/b/QXODW');

      List data = response.data;

      productList =
          data.map((e) => product.fromJson(e)).toList();

      emit(ProductGetSucess());
    } catch (e) {
      emit(ProductGetError(e.toString()));
    }
  }
addToCart(dynamic p){

  productListCart.add(p);

    emit(AddedToCart());
  return productListCart;

}

deleteToCart(dynamic p){

    productListCart.remove(p);

    emit(AddedToCart());
    return productListCart;

  }

changeIconCart(){
  isCLick =!isCLick;
  emit(state);
}
}