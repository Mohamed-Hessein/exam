import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/cubit/cubit.dart';
import 'package:exam/cubit/state.dart';
import 'package:exam/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_sheet.dart';

class CardCustom extends StatefulWidget {
   CardCustom({ required this.product,required this.onTap,super.key,required this.addedId,required this.reviews, required this.image,required this.desc,required this.price,required this.rate});
   String image;
   dynamic desc;
    double price;
    double rate;
   dynamic addedId;
   dynamic reviews;
   Function onTap;
var product;
  @override
  State<CardCustom> createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
bool isCLick =false;
int counter = 0;

  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<ProductCubit, ProductState>(
      builder: (context , state){

        return  SizedBox(

            width: 164,
            child: Container(child: Card(
              elevation: 0,
              color: Colors.white,
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: CachedNetworkImage(
                        imageUrl: '${widget.image}',
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),),
                  ),
                  Text(widget.desc,maxLines: 2,overflow: TextOverflow.ellipsis,softWrap:true,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)

                  ,Row(children: [Icon(Icons.star,color: Colors.yellow,), Text('${widget.rate}',style: TextStyle(fontSize: 10,color: Colors.grey),),SizedBox(width: 10,),Text('(${widget.reviews} reviews)',style: TextStyle(fontSize: 10,color: Colors.grey),)],)
                  ,
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('${widget.price}',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),

                      SizedBox(

                        child: GestureDetector(

                            onTap: (){
                              showModalBottomSheet(   context: context, builder: ( context)  =>             BottomSheetCusotm(product: widget.product,));
                        isCLick =!isCLick;
                        Timer(Duration(seconds: 2), (){

                          Navigator.pop(context);
                        });
                        setState(() {

                        });

                            },
                            child:isCLick? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                elevation: 0,
                                color: Colors.white,
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(iconSize: 10,onPressed: () {counter--;
                                      BlocProvider.of<ProductCubit>(context).deleteToCart(widget.addedId);
                                      if(counter < 1){

                                        counter =0 ;
                                        isCLick = false;
                                        
                                      }
                                        setState(() {

                                        });
                                        }, icon: Icon(Icons.remove,color:counter == 1? Colors.blue:Colors.grey,size: 20,)),
                                      SizedBox(width: 2,),
                                      Text('$counter',style: TextStyle(fontSize: 10,color: Colors.blue),),
                                      IconButton(iconSize: 10,color: Colors.blue, onPressed: () {

                                        counter++;
                                   if(widget.product == null){

                                      isCLick = false;
                                   }



                                        BlocProvider.of<ProductCubit>(context).addToCart(widget.addedId);


                                        setState(() {

                                        });

                                      }, icon: Container(
                                        width: 30,
                                          height: 30,
                                         decoration: BoxDecoration( color: Colors.blue,borderRadius: BorderRadius.circular(5)),
                                          child: Icon(Icons.add,color: Colors.white,size: 20,))),
                                    ],
                                  ),
                                ),
                              ),
                            )
                                :ImageIcon(AssetImage('assets/images/shopping-basket-add-01.png'),size: 20,color: Colors.blue,)),
                      )
                    ],
                  )
                ],
              ),),));
      },

    );
  }
}