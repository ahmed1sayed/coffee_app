import 'package:flutter/material.dart';
import 'package:for_jop/pages/app_screens/details_screen.dart';

import '../../main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller =TextEditingController();
  List<Widget>items=[
    Container( width:150 ,
      decoration: BoxDecoration(color: defaultColor,
    borderRadius: BorderRadius.circular(20),
 border: Border.all( color:  backColor ,width: 1)

 ),

      child:  const Center(child:Text('Cappuccino',style: TextStyle(color:Colors.white ),)),),
    Container( width:150 ,
      decoration: BoxDecoration(color: Colors.white ,
          borderRadius: BorderRadius.circular(20),
          border: Border.all( color:  Colors.black12 ,width: 1)
    ),
      child:  const Center(child:Text('Cold brew',style: TextStyle(color: backColor),)),),
    Container( width:150 ,
      decoration: BoxDecoration(color: Colors.white ,
          borderRadius: BorderRadius.circular(20), border: Border.all( color:  Colors.black12 ,width: 1)
 ),

 child:  const Center(child:Text('Espresso',style: TextStyle(color: backColor),)),)
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          SizedBox (height: 80,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:   [
              //SizedBox (width: 20,),
                const CircleAvatar(backgroundColor:defaultColor,radius: 30,),
               // SizedBox (width: 50,),
               Center(
                 child: Row(children: const [  Icon(Icons.location_on,color: backColor,),
                   Text('city,country'),   ],),
               ),
                   // SizedBox (width: 50,),

                const Icon(Icons.notification_important_rounded)

              ]),
            ),

 ),
          const Padding(padding: EdgeInsets.all(15),
            child: Text('Good morning ,Ahmed',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 25),),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(width: 380,
                  height: 50,
                  child: TextField(
                      controller: controller,
                    onTap: (){},
                    decoration:   InputDecoration(
                     prefixIcon:   const Icon( Icons.search),
                      suffixIcon:const Padding(
                        padding:  EdgeInsets.only(right: 5.0),
                        child: Icon( Icons.menu_outlined,color: defaultColor,size: 25,),
                      ),
                        hintText: 'Search coffee',

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: const BorderSide(color: Colors.black))

                    ),

                  ),
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Categories',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w800 ),),
          ),/*HomeCubit.get(context).categoryModel!=null?*/
          const SizedBox(height: 10,),

          SizedBox(height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>items[index],
                separatorBuilder:   (context,index)=>const SizedBox(width: 10,),
                itemCount: items.length
            ),
          ),

          const SizedBox(height: 20,),
      const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child:    Text('Products',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w800 ),),
      ), const SizedBox(height: 10,),

          Container(

            alignment: Alignment.topCenter,

            //padding: const EdgeInsets.only(top: 1),
            color: backColor,
            child:  GridView.count(
              mainAxisSpacing: 1,
              crossAxisSpacing: 3,
              crossAxisCount:2,
              childAspectRatio: 1/1.25,

              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate( 2,
                      (index) => buildProductsItem(index: index, context: context)),

            ),

          ),
          const SizedBox(height: 20,),
      const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child:    Text('Offers',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w800 ),),
      ),const SizedBox(height: 10,),

          Container(
            //padding: const EdgeInsets.only(top: 1),
            color: backColor ,
            child:  GridView.count(
              mainAxisSpacing: 1,
              crossAxisSpacing: 3,
              crossAxisCount:2,
              childAspectRatio: 1/1.25,

              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate( 2,
                      (index) => buildOffersItem(index: index, context: context)),

            ),

          )
        ],
      ),
    ),
    );
  }
}
Widget buildProductsItem({required int index ,required context, }) {

  double appWidth = MediaQuery
      .of(context)
      .size
      .width;
  return /*InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(

          builder: (context)=>article['url']!=null?
          WebViewScreen(url: article['url']):const CircleAvatar()));
    },
    child:*/ Container(
    padding: const EdgeInsets.only(top: 10),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [          const SizedBox(height: 5),


    InkWell(onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DetailsScreen()
      )
      );
    },
      child:  Container(
                height: appWidth * .33,
                width:  appWidth * .33,
                decoration:   BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/pexhrfgfdgfgdfgn-13510337.png', ),
                    //  fit: BoxFit.cover
                  ),
                  //   borderRadius: BorderRadius.circular(10)
                ),
              ),
           ),

        const SizedBox(height: 20,),

        Expanded(

          child: Padding(
            padding: const EdgeInsets.only(left: 7.0,right: 7),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('cappuccino',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  // ,maxLines: 4,overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5,),
                Row(//mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('22\$',
                      style:TextStyle(color:defaultColor,fontSize: 18),),
                    IconButton(onPressed: (){

                    }, icon: const Icon(Icons.shopping_cart),color: backColor,),

                    const Spacer(),
                    CircleAvatar(

                        backgroundColor:defaultColor ,
                        child: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.favorite_border)))

                  ],
                ),

              ],),
          ),
        )
      ],),
  );
}
Widget buildOffersItem({required int index ,required context, }) {
  double appWidth = MediaQuery
      .of(context)
      .size
      .width;
  return /*InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(

          builder: (context)=>article['url']!=null?
          WebViewScreen(url: article['url']):const CircleAvatar()));
    },
    child:*/ Container(
    padding: const EdgeInsets.only(top: 10),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ const SizedBox(height: 5),

        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DetailsScreen()
            )
            );},
              child: Container(
                height: appWidth * .33,
                width: appWidth * .33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/pexhrfgfdgfgdfgn-13510337.png',),
                    //  fit: BoxFit.cover
                  ),
                  //   borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Container(color: Colors.red,
              height: 14,
              width: 57,
              child: const Center(child: Text('DISCOUNT', style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),)),)
          ],
        ),
        const SizedBox(height: 20,),

        Expanded(

          child: Padding(
            padding: const EdgeInsets.only(left: 7.0, right: 7),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('cappuccino',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  // ,maxLines: 4,overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5,),
                Row( //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('22\$',
                      style: TextStyle(color: Colors.brown, fontSize: 16),),
                    const SizedBox(width: 10,),

                    const Text('50\$',
                      style: TextStyle(color: Colors.grey, fontSize: 13,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    IconButton(onPressed: (){

                    }, icon: const Icon(Icons.shopping_cart),color: backColor,),
                    const Spacer(),
                    CircleAvatar(

                        backgroundColor: defaultColor,
                        child: IconButton(onPressed: () {

                        }, icon: const Icon(Icons.favorite_border)))

                  ],
                ),

              ],),
          ),
        )
      ],),
  );
}