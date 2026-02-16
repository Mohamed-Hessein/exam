import 'dart:async';

import 'package:exam/cart_screen.dart';
import 'package:exam/cubit/cubit.dart';
import 'package:exam/cubit/state.dart';
import 'package:exam/widget/bottom_sheet.dart';
import 'package:exam/widget/custom_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});
static const routeName = '/home'
;  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state){

      },
      builder: (context, state){
        if(state is ProductGetLoading){
          return Center(child: CircularProgressIndicator());
        }else if( state is ProductGetError){
          print(state.error);
        return  Text(state.error);
        }
    var bloc = BlocProvider.of<ProductCubit>(context);
       return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(textAlign: TextAlign.start,'Recommendations ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)

                ,Expanded(
                  child: GridView.builder(
                    itemCount: bloc.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3), itemBuilder: ( context,  index) {

                 var product =   bloc.productList[index];
                 print(product.image);
                    return   GestureDetector(
                      onLongPress: (){
                        showBottomSheet(context: context, builder: (context){

                          return BottomSheetCusotm(product: product,);
                        });
                        Timer(Duration(seconds: 3), (){

                          Navigator.pop(context);
                        });

                      },
                      child: CardCustom(
                        product: product,
                        onTap: (){

                        },
                        addedId: product,
                                           reviews: product.rating?.count?.toString() ?? '',
                                           image: product.image ?? '',
                                           desc: product.description ?? '',
                                           price: product.price ?? 0.0,
                                           rate: product.rating?.rate ?? 0.0,
                                         ),
                    );
                  },
                  ),
                ),


              ],),
          ),
          appBar: AppBar(
            leadingWidth: 80,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.asset('assets/images/logo.png',width: 40,height: 40,),
            ),
            actions: [ImageIcon(AssetImage('assets/images/shopping-basket-01.png')),SizedBox(width: 15,)],),
        );
      },

    );
  }
}

