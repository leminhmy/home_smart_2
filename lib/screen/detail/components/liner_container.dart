import 'package:flutter/material.dart';

import '../../../widget/big_text.dart';

class LinerContainer extends StatefulWidget {
  final ValueChanged<double>? valueSelected;
  final int linerValueDefault;
  final int valueDefault;
  const LinerContainer({
    Key? key,  this.valueSelected,  this.linerValueDefault = 5, this.valueDefault = 4,

  }) : super(key: key);

  @override
  State<LinerContainer> createState() => _LinerContainerState();
}

class _LinerContainerState extends State<LinerContainer> {

  late int linerValueDefault;
  late double setLinerValue;
  List<double> listValue = [];

  @override
  void initState(){
    super.initState();
    linerValueDefault = widget.linerValueDefault;
    for(int i = 1; i <= linerValueDefault; i++){
      listValue.add(i/linerValueDefault);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0,end: (widget.valueDefault / widget.linerValueDefault)),
      duration: Duration(seconds: 3),
      curve: Curves.elasticInOut,
      builder: (context,double value, child) {
        setLinerValue = value;
        print(value);
        return StatefulBuilder(
          builder: (context, setState2) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Fan Speed"),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onHorizontalDragUpdate: (DragUpdateDetails update){
                      setState2((){
                        setLinerValue = update.globalPosition.dx / (size.width);
                      });

                    },
                    onHorizontalDragEnd: (DragEndDetails update){
                      double setValue = listValue.firstWhere((element) => element > setLinerValue && element != setLinerValue);
                      setState2((){
                        setLinerValue = setValue;
                      });
                      widget.valueSelected!(setValue * linerValueDefault);
                    },
                    child: SizedBox(
                      height: 40,
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect rect){
                              return LinearGradient(
                                stops: [setLinerValue * 0.3,setLinerValue * 0.6,setLinerValue * 1,0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.lightBlue,
                                  Colors.blueAccent,
                                  Colors.indigo,
                                  Colors.grey,
                                ],
                              ).createShader(rect);
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(linerValueDefault+1, (index) {

                              if(index != 0 && index != linerValueDefault){
                                return Container(
                                  color: Colors.grey.shade200,
                                  width: 7,
                                );
                              }else{
                                return Container();
                              }


                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}
