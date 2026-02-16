class ProductState{}
class ProductGetIniatal extends ProductState{}

class ProductGetLoading extends ProductState{}
class ProductGetSucess extends ProductState{}
class ProductGetError extends ProductState{
  String error;
  ProductGetError(this.error);

}
class inaitlCart extends ProductState{}
class AddedToCart extends ProductState{}