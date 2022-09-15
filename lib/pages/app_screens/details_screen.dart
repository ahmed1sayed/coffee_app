import 'dart:math';

 import 'package:flutter/material.dart';

import '../../main.dart';

class DetailsScreen extends StatelessWidget {
 // final Image image;

  const DetailsScreen({Key? key, /*required this.image*/})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor:Colors.blueGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text(
         'Cappuccino',
          style: TextStyle(color:Colors.white),
        ),
        background:   Image.asset(
            'assets/images/pexhrfgfdgfgdfgn-13510337.png',
            fit: BoxFit.cover,
          ),

      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.orangeAccent,
      thickness: 2,
    );
  }






  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor:  defaultColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                  padding:const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [characterInfo('type : ', 'hot drinks'),
                            Container(

                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(color: backColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all( width: 1)

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                Icon(Icons.star,color: Colors.orangeAccent,),
                                Text('4.9')
                              ],),
                            )

                          ]),
                      buildDivider(315),
                      characterInfo('type : ', 'hot drinks'),
                      buildDivider(250),
                      characterInfo('price : ', '22\$'),
                      buildDivider(150),
                      characterInfo('the ingredients :', ' Coffee,caramel And coffee cream'),
                       buildDivider(280),


                    ],
                  ),
                ),
                const SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}