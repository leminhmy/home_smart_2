import 'package:flutter/material.dart';
import 'package:home_smart_2/utils/math.dart';
import 'package:home_smart_2/widget/big_text.dart';
import 'dart:math' as math;

import '../../widget/small_text.dart';
import 'components/circular_slider.dart';
import 'components/liner_container.dart';
const TWO_PI = 3.14 * 2;
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  List<String> image = [
    'assets/images/icon_trans.png',
    'assets/images/icon_trans.png',
    'assets/images/icon_trans.png',
    'assets/images/icon_trans.png',
  ];

  int indexSelected = 0;
  double currentAngle = 0;


  @override
  Widget build(BuildContext context) {
    Offset _currentDragOffset = Offset.zero;
    Size size = MediaQuery.of(context).size;
    Size canvasSize = Size(size.width,size.width-130);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(center - Offset(size.width * 0.05, size.width * 0.05),
        currentAngle + toRadian(150), 120);
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
      bottomNavigationBar: BottomBarCustom(),
    );
  }

  buildBody(Size size, BuildContext context) {
    return Column(
            children: [
              SizedBox(height: 10,),
              Container(
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
              ),
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
              SizedBox(
                height: size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularSlider(
                      onAngleChanged: (angle) {

                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(size.height * 0.05),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 15,
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: "25°",color: Colors.lightBlue,fontSize: 50,),
                          SmallText(text: "Current 21°C")
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.remove,color: Colors.grey,size: 25,),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.add,color: Colors.grey,size: 25,),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
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
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.arrow_back,color: Colors.black,),
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
          );
  }
}

class BottomBarCustom extends StatefulWidget {
  const BottomBarCustom({
    Key? key,
  }) : super(key: key);


  @override
  State<BottomBarCustom> createState() => _BottomBarCustomState();
}

class _BottomBarCustomState extends State<BottomBarCustom> {

  final List<bool> _selection = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(1,0),
            blurRadius: 1,
            spreadRadius: 1
          )
        ]
      ),
      child: ToggleButtons(
        renderBorder: false,
        isSelected: _selection,
        color: Colors.grey,

        fillColor: Colors.transparent,
        onPressed: (int index){
          setState((){
            _selection[index] = !_selection[index];

          });
        },
        children: [
          SizedBox(
            width: size.width * 0.25,
            child: Icon(Icons.light_mode_outlined,size: 40,),

          ),
          SizedBox(
            width: size.width * 0.25,
            child: Icon(Icons.ac_unit_outlined,size: 40,),

          ),
          SizedBox(
            width: size.width * 0.25,
            child: Icon(Icons.water_drop_outlined,size: 40,),

          ),
          SizedBox(
            width: size.width * 0.25,
            child: Icon(Icons.air,size: 40,),

          )
        ]
      ),
    );
  }
}



class KnobCustomPaint extends CustomPainter{
  final double currenAngle;
  final double maxAngle;

  KnobCustomPaint({required this.currenAngle,required this.maxAngle});
  @override
  void paint(Canvas canvas, Size size) {

    Offset center = size.center(Offset.zero);
    double radius = size.width * 0.32;
    double strokeWitdh = size.width * 0.03;

    //test
    double currenMaxAngle = (maxAngle/maxAngle)*(math.pi * 1.3);
    double currenAngle = (this.currenAngle/maxAngle)*(math.pi * 1.3);
    //test


    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
    ..shader = SweepGradient(colors: [Colors.indigo,Colors.lightBlueAccent,Colors.indigo,]).createShader(rect)
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWitdh
    ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      toRadian(150),
      currenMaxAngle,
      false,
      Paint()
        ..color = Colors.grey.shade300
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWitdh
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawArc(rect, toRadian(150), currenAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

