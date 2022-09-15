import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../cach_helper.dart';
import '../main.dart';
import 'home_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController boardingController=PageController();

  bool isLast=false;
  void submit(){
    CacheHelper.saveData(key:'onBoarding' ,value:true ).then((value) {
      if(value == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage() /*const Home()*/,
            ), (route) {
          return false;
        });
      }
    });
  }
  List<BoardingModel>boarding=[
    BoardingModel('take your favorite coffee', 'awesome and amazing drinks'),
    BoardingModel( 'a lot of coffee drinks','enjoy your life with our coffee'),
    BoardingModel( 'an easy app to use','we have  hot and cold drinks'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Stack(

        children: [
          const Image(image: AssetImage('assets/images/coooooov312418.jpg',),fit: BoxFit.fitHeight, height: double.maxFinite),
          Positioned(
            top: 20,
            right: 4,
            child: TextButton(onPressed: () {
              setState(()=>  submit() );

            }, child: const Text('skip', style: TextStyle(
              // ignore: use_full_hex_values_for_flutter_colors
                color: Colors.deepOrange,
                fontSize: 20),),),
          ),
          Padding(
            padding: const EdgeInsets.all(30),


              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


              Expanded(child:
                  PageView.builder(
                    itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                    controller: boardingController,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {/*
                          if (isLast) {

                            submit();

                          } else {
                            boardingController.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeIn);
                          }
                      */
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    physics: const BouncingScrollPhysics(),
                  )),


                  SmoothPageIndicator(controller: boardingController,
                    count: boarding.length,
                    effect: const ExpandingDotsEffect(
                      dotColor:backColor ,
                      activeDotColor: defaultColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 4,

                    ),),



              ],),

          ),
        ],
      ),
    );
  }
  buildBoardingItem(BoardingModel boarding) =>

      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(height: 100,),
            Text(boarding.title,style: const TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            Text(boarding.body,style: const TextStyle(color: Colors.white70, fontSize: 20 ))


    ],
  );
}


class BoardingModel{

  String title;
  String body;

  BoardingModel( this.title, this.body);
}
// echo "# coffee_app" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/ahmed1sayed/coffee_app.git
// git push -u origin main