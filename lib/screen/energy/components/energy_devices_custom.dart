import 'package:flutter/material.dart';

import '../../../widget/big_text.dart';
import '../../../widget/small_text.dart';
import 'custom_slider.dart';

class EnergyDevicesCustom extends StatelessWidget {
  const EnergyDevicesCustom({
    Key? key, required this.iconData, required this.name, required this.valueDefault, required this.price,
  }) : super(key: key);

  final IconData iconData;
  final String name;
  final double valueDefault;
  final double price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(iconData,color: Colors.blue,size: 35,)
                  ],
                ),
              ),
              Expanded(child:  Column(
                children: [
                  Row(
                    children: [
                      BigText(text: name,),
                      SizedBox(width: 5,),
                      SmallText(text: "(\$$price)",),
                    ],
                  ),
                  SliderWidgetCustom(valueDefault: valueDefault),

                ],
              ),
              ),
              Icon(Icons.arrow_forward_ios,size: 22,color: Colors.grey,),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container(
                height: 1,
                color: Colors.grey.shade300,
              ))
            ],
          )
        ],
      ),
    );
  }
}
