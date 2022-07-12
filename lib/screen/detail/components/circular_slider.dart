import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../utils/math.dart';
import '../../../widget/big_text.dart';
import '../../../widget/small_text.dart';

double radius = 135;
double strokeWidth = 12;

class CircularSlider extends StatefulWidget {
  final int valueRadiusDefault;
  final double valueRadiusMax;

  const CircularSlider({
    Key? key, required this.valueRadiusDefault, required this.valueRadiusMax,

  }) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset _currentDragOffset = Offset.zero;

  double currentAngle = 0;
  int valueRadius = 0;

  double startAngle = toRadian(150);

  double totalAngle = toRadian(360);




  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width - screenSize.height * 0.19);
    Offset center = canvasSize.center(Offset.zero);
    Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
        tween: Tween(begin: 0.0,end: 1.0),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        builder: (context,double value, child) {
          currentAngle = ((widget.valueRadiusDefault/widget.valueRadiusMax)*(math.pi * 1.3) * value);
          valueRadius = ((currentAngle / (math.pi * 1.3)) * widget.valueRadiusMax).toInt();

          return StatefulBuilder(
          builder: (context, setState2) {
            Offset knobPos = toPolar(center - Offset(strokeWidth, strokeWidth),
                currentAngle + startAngle, radius);
            return SizedBox(
              height: size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: canvasSize,
                    child: Container(),
                    painter: SliderPainter(
                      startAngle: startAngle,
                      currentAngle: currentAngle,
                    ),
                  ),
                  Positioned(
                    left: knobPos.dx,
                    top: knobPos.dy,
                    child: GestureDetector(
                      onPanStart: (details) {
                        RenderBox getBox = context.findRenderObject() as RenderBox;
                        _currentDragOffset = getBox.globalToLocal(details.globalPosition);
                      },
                      onPanUpdate: (details) {
                        var previousOffset = _currentDragOffset;
                        _currentDragOffset += details.delta;
                        var angle = currentAngle +
                            toAngle(_currentDragOffset, center) -
                            toAngle(previousOffset, center);
                        currentAngle = normalizeAngle(angle);
                        valueRadius = ((currentAngle / (math.pi * 1.3)) * widget.valueRadiusMax).toInt();
                        setState2(() {});
                      },
                      child: const _Knob(),
                    ),
                  ),
                ],
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
                        BigText(text: "$valueRadius°",color: Colors.lightBlue,fontSize: 50,),
                        SmallText(text: "Current ${widget.valueRadiusDefault}°C")
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            valueRadius>0?valueRadius = valueRadius-1:valueRadius;
                            currentAngle = ((valueRadius/widget.valueRadiusMax)*(math.pi * 1.3));
                            setState2((){});
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.remove,color: Colors.grey,size: 25,),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            valueRadius<41?valueRadius = valueRadius+1:valueRadius;
                            currentAngle = ((valueRadius/widget.valueRadiusMax)*(math.pi * 1.3));
                            setState2((){});
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.add,color: Colors.grey,size: 25,),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );

          }
        );
      }
    );
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  SliderPainter({required this.startAngle, required this.currentAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
      ..shader = SweepGradient(colors: [Colors.indigo,Colors.lightBlueAccent,Colors.indigo,]).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      math.pi * 1.3,
      false,
      Paint()
        ..color = Colors.grey.shade300
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Knob extends StatelessWidget {
  const _Knob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,0),
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 1
            ),
            BoxShadow(
                offset: Offset(0,3),
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 3
            )
          ]
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),

      ),
    );
  }
}

