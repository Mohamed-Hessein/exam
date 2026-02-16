import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cart_screen.dart';

class BottomSheetCusotm extends StatelessWidget {
  BottomSheetCusotm({super.key,required this.product});

  var product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:250,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(textAlign: TextAlign.start,'${product.title}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),


        ),

          Row(children: [Text('Added To Cart '), Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageIcon(AssetImage('assets/images/sucess.png'),color: Colors.green,),
          )],)
          ,
          SizedBox(
            height: 40,
            child: ElevatedButton(
                style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFf004AAC),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                ,  onPressed: (){

              Navigator.pushNamed(context, CartScreen.routeName,arguments: product);

            }, child: Center(child: Text('View Cart',style: TextStyle(color: Colors.white),))
            ),
          )
          ,SizedBox(height: 15,),
          SizedBox(           height: 40,

            child: ElevatedButton(

                style:  ElevatedButton.styleFrom(side: BorderSide(color: Color(0xFf004AAC),width: 1),backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                ,  onPressed: (){}, child: Center(child: Text('Continue Shopping '))
            ),
          )
        ],

      ),),
    );
  }
}