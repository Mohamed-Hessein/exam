import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/cubit/cubit.dart';
import 'package:exam/cubit/state.dart';
import 'package:exam/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state){


        return   Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Items Total',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),

                Text('EGP 96,449',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),

              ],
            )

              ,
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Items Total',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),

                  Text('EGP 96,449',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),

                ],
              )        ,  SizedBox(height: 15,),Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Items Total',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),

                  Text('EGP 96,449',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),

                ],
              ),
              SizedBox(height: 15,),
              Text('4 Items',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),



              Expanded(
                child: ListView.builder(
                  itemCount: BlocProvider.of<ProductCubit>(context).productListCart.length,
                  itemBuilder: (context, index) {
                    var productItem = BlocProvider.of<ProductCubit>(context).productListCart[index];


                    String shortTitle = (productItem.title ?? '');
                    if (shortTitle.length > 15) shortTitle = '${shortTitle.substring(0, 15)}...';

                    String shortDesc = (productItem.description ?? '');
                    if (shortDesc.length > 20) shortDesc = '${shortDesc.substring(0, 20)}...';

                    int counter = 1;

                    return StatefulBuilder(
                      builder: (context, setStateSB) {
                        return SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.white,
                            elevation: 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 72,
                                  height: 95,
                                  child: CachedNetworkImage(
                                    imageUrl: productItem.image ?? '',
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('$shortTitle', style: TextStyle(color: Colors.black, fontSize: 16)),
                                          SizedBox(height: 5),
                                          Text(
                                            '$shortDesc',
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('EGP', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
                                              Text('${productItem.price}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                              SizedBox(width: 15),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Card(
                                                    elevation: 0,
                                                    color: Colors.white,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        IconButton(
                                                          iconSize: 20,
                                                          onPressed: () {
                                                            if (counter > 0) {
                                                              setState(() => counter--);
                                                              BlocProvider.of<ProductCubit>(context).deleteToCart(productItem);
                                                            }
                                                          },
                                                          icon: Icon(Icons.remove, color: Colors.blue),
                                                        ),
                                                        Text('$counter', style: TextStyle(fontSize: 12, color: Colors.blue)),
                                                        IconButton(
                                                          iconSize: 20,
                                                          onPressed: () {
                                                            setState(() => counter++);
                                                            BlocProvider.of<ProductCubit>(context).addToCart(productItem);
                                                          },
                                                          icon: Container(
                                                            width: 30,
                                                            height: 30,
                                                            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                                                            child: Icon(Icons.add, color: Colors.white, size: 20),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 15),

                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<ProductCubit>(context).deleteToCart(productItem);
                                        },
                                        child: ImageIcon(AssetImage('assets/images/delete.png'), size: 24, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

            ],),
        ),
        appBar: AppBar(
          actions: [Image.asset('assets/images/noti_cart_ic.png',width: 24,height: 24,),SizedBox(width: 15,)],
          centerTitle: true,
          title: Text('My Cart',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(

                onTap: (){
                  Navigator.pop(context);
                },
                child: ImageIcon(AssetImage('assets/images/arrow-left-01.png'),color: Colors.blue,)),
          ),),
      );},

    );
  }
}
