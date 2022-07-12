import 'package:flutter/material.dart';
import 'package:home_smart_2/utils/math.dart';
import 'package:home_smart_2/widget/big_text.dart';
import 'dart:math' as math;

import '../../widget/small_text.dart';
import 'components/bottom_custom.dart';
import 'components/circular_slider.dart';
import 'components/liner_container.dart';
const TWO_PI = 3.14 * 2;
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(size),
            buildBody(size, context),

          ],
        ),
      ),
      bottomNavigationBar: const BottomBarCustom(),
    );
  }

  buildBody(Size size, BuildContext context) {
    return Column(
            children: [
              Devices(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.power_settings_new_outlined,color: Colors.white,size: 25,),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.alarm_rounded,color: Colors.grey,size: 25,),
                    ),
                  ],
                ),
              ),
             const CircularSlider(
                valueRadiusDefault: 25,
                valueRadiusMax: 41,
              ),
              SizedBox(height: 10,),
              LinerContainer(
                valueSelected: (value){

                },
              ),
            ],
          );
  }


   buildAppBar(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                ),
                Column(
                  children: [
                    BigText(text: "Living Room",),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: size.height * 0.01,
                          height: size.height * 0.01,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                        ),
                        SizedBox(width: 5,),
                        const SmallText(text: "4 Devices",),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.add,color: Colors.black,),
                ),
              ],
            ),
    );
  }
}

class Devices extends StatefulWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {

  List<String> image = [
    'assets/images/icon_trans.png',
    'assets/images/cctv-camera.png',
    'assets/images/bulb.png',
    'assets/images/television.png',
  ];

  int indexSelected = 0;
  double currentAngle = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/living_home.png'),
        ),

      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey.shade200,
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.1),
                  ]
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    children:List.generate(image.length, (index) => GestureDetector(
                      onTap: (){
                        setState((){
                          indexSelected = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        height: 80,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: indexSelected == index? Border.all(
                              width: 2,
                              color: Colors.blue
                          ):null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            indexSelected == index?ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds){
                                return LinearGradient(
                                    colors: [
                                      Colors.blueAccent,
                                      Colors.blueAccent,
                                    ]
                                ).createShader(bounds);
                              },
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.all(5),
                                width: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(image[index]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ):Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(image[index]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),)
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}







