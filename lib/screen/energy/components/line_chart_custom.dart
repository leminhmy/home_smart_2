import 'package:flutter/material.dart';

import '../../../widget/small_text.dart';
class LineChartColumnCustom extends StatefulWidget {
  const LineChartColumnCustom({Key? key, this.heightContainer = 350,  this.valueAxisY = 5, required this.listValueColumn, required this.listValueRow}) : super(key: key);

  final double heightContainer;
  final int valueAxisY;
  final List<double> listValueColumn;
  final List<dynamic> listValueRow;


  @override
  State<LineChartColumnCustom> createState() => _LineChartColumnCustomState();
}

class _LineChartColumnCustomState extends State<LineChartColumnCustom> {

  int indexSelected = 3;
  late List<int> listAxisY;
  late List<dynamic> listAxisX;
  late double valueMaxList;
  late double valueMaxY;




  @override
  void initState(){
    super.initState();
    listAxisX = List.from(widget.listValueRow);
    listValueAxisY();

  }

  void listValueAxisY() {
    //getValueMaxList
    valueMaxList = widget.listValueColumn.reduce((value, element) => value > element ? value:element);
    //fn get values
    int lenghtMaxValueList = valueMaxList.toInt().toString().length;
    int getValueLenght1 = int.parse(valueMaxList.toString().split("")[0]);
    int getValueLenght2 = int.parse(valueMaxList.toString().split("")[1]);
    //fn lấy ra số đó thuộc loại đơn vị nào
    List<String> percent = List.generate(lenghtMaxValueList - 1, (index) => "0");
    String valueCalculator = '1${percent.join()}';
    //fn phép tính, giá trị gốc + thêm bao nhiêu,
    if(getValueLenght2 > 4){
      valueMaxY = (getValueLenght1 + 1) * double.parse(valueCalculator);
    }else{
      valueMaxY = (getValueLenght1 * double.parse(valueCalculator))+((5 * int.parse(valueCalculator))*0.1);
    }
    //giá trị đã tính, phân tách thành n đơn vị trong mảng
    var list = List.generate(widget.valueAxisY, (index) => ((valueMaxY/widget.valueAxisY)*(index+1)).toInt()).reversed;
    listAxisY = List.from(list);

  }

  double valueColumn(double value){
    double a = valueMaxY / value;
    double height = widget.heightContainer / a;
    return height;
  }


  @override
  Widget build(BuildContext context) {

    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        tween: Tween(begin: 0.0,end: 1.0),
        builder: (context,double valueAnimation, child) {
        return StatefulBuilder(
          builder: (context,setState2) {
            return GestureDetector(
              onTap: (){
                setState2((){
                  indexSelected = -1;
                });
              },
              child: Container(
                height: widget.heightContainer,
                margin: EdgeInsets.only(bottom: widget.heightContainer*0.25,top:widget.heightContainer*0.15 ),
                decoration: const BoxDecoration(

                    border: Border(
                        top: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )
                    )
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                        children: List.generate(listAxisY.length, (index) => Expanded(child: Container(
                          padding: EdgeInsets.only(left: widget.heightContainer*0.06),
                          alignment: Alignment.centerLeft,
                          decoration:const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 0.5,
                                  )
                              )
                          ),
                          child: SmallText(text: "\$${listAxisY[index]}",),
                        ),
                        ))),
                    Positioned(
                        bottom: -widget.heightContainer*0.2,
                        right: 0,
                        left: 0,
                        child: Container(
                          margin: EdgeInsets.only(left: widget.heightContainer *0.23),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: List.generate(listAxisX.length, (index) => GestureDetector(
                                onTap: (){
                                  setState2((){
                                    indexSelected==index?indexSelected = -1:indexSelected = index;
                                  });
                                },
                                child: Container(
                                  width: widget.heightContainer*0.15,
                                  height: widget.heightContainer * 1.5,
                                  color: Colors.transparent,
                                  clipBehavior: Clip.none,
                                  margin: EdgeInsets.only(right: widget.heightContainer*0.143),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      index ==indexSelected?SizedBox(
                                        height: widget.heightContainer*0.115,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                                right: -widget.heightContainer*0.17,
                                                left: -widget.heightContainer*0.17,
                                                child: ClipPath(
                                                  clipper: ShowNoteCustom(),
                                                  child: Container(height: widget.heightContainer*0.143,width: widget.heightContainer*0.42,
                                                    alignment: Alignment.center,
                                                    padding:  EdgeInsets.only(bottom: widget.heightContainer * 0.03),
                                                    decoration: BoxDecoration(
                                                      color: Colors.green.shade400,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: SmallText(text: "40 kWh",color: Colors.white),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ):Container(height: widget.heightContainer * 0.14,),
                                      SizedBox(height: widget.heightContainer * 0.086,),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: valueColumn(widget.listValueColumn[index]) * valueAnimation,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(3),
                                                  gradient: index ==indexSelected?LinearGradient(
                                                      begin: Alignment.bottomCenter,
                                                      end: Alignment.topCenter,
                                                      colors: [
                                                        Colors.lightBlueAccent,
                                                        Colors.blue,
                                                        Colors.indigo,
                                                      ]
                                                  ):LinearGradient(
                                                      begin: Alignment.bottomCenter,
                                                      end: Alignment.topCenter,
                                                      colors: [
                                                        Colors.blue.withOpacity(0.5),
                                                        Colors.blue.withOpacity(0.5),
                                                      ]
                                                  )
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 8),
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SmallText(text: listAxisX[index].toString(),fontSize: 25,),
                                                  SizedBox(height: 5,),
                                                  index == indexSelected?Container(
                                                    height: 8,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2),
                                                        gradient: LinearGradient(
                                                            begin: Alignment.centerLeft,
                                                            end: Alignment.centerRight,
                                                            colors: [
                                                              Colors.lightBlueAccent,
                                                              Colors.blue,
                                                              Colors.indigo,
                                                            ]
                                                        )
                                                    ),
                                                  ):Container(height: 8,)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}


class ShowNoteCustom extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;

    path.quadraticBezierTo(0, h, 0, h*0.7);
    path.quadraticBezierTo(0, h*0.8, w*0.05, h*0.8);
    path.quadraticBezierTo(0, h*0.8, w * 0.3, h*0.8);

    path.quadraticBezierTo(w * 0.45, h*0.8, w * 0.5, h);

    path.quadraticBezierTo(w * 0.55, h*0.8, w*0.7, h*0.8);

    path.quadraticBezierTo(w * 0.6, h*0.8, 0, h*0.8);
    path.quadraticBezierTo(w, h*0.8, w*0.95, h*0.8);
    path.quadraticBezierTo(w, h*0.8, w, h*0.7);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }






}
