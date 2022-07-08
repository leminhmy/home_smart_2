import 'package:flutter/material.dart';
import 'package:home_smart_2/widget/big_text.dart';

import '../../widget/small_text.dart';
import 'components/custom_slider.dart';
import 'components/drop_down_button.dart';

class EnergyScreen extends StatelessWidget {
  const EnergyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(size),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)


              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.power_outlined,color: Colors.blue,size: 35,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SmallText(text: "Today",),
                            SizedBox(height: 10,),
                            BigText(text: "93 kWh",color: Colors.black,),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bolt_outlined,color: Colors.blue,size: 35,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: "This month",),
                            SizedBox(height: 10,),
                            BigText(text: "970,422 kWh",color: Colors.black,),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 350,
              color: Colors.green,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Energy Saved by Devices"),
                  CustomDropDownButton(),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 120,
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
                            Icon(Icons.lightbulb_outline_sharp,color: Colors.blue,size: 35,)
                          ],
                        ),
                      ),
                      Expanded(child:  Column(
                        children: [
                          Row(
                            children: [
                              BigText(text: "Air Conditioning",),
                              SizedBox(width: 5,),
                              SmallText(text: "(\$10)",),
                            ],
                          ),
                          SliderWidgetCustom(),

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
            ),
            Container(
              height: 120,
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
                            Icon(Icons.lightbulb_outline_sharp,color: Colors.blue,size: 35,)
                          ],
                        ),
                      ),
                      Expanded(child:  Column(
                        children: [
                          Row(
                            children: [
                              BigText(text: "Air Conditioning",),
                              SizedBox(width: 5,),
                              SmallText(text: "(\$10)",),
                            ],
                          ),
                          SliderWidgetCustom(),

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
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(size.height * 0.010),
          height: size.height * 0.05,
          width: size.height * 0.05,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Wrap(
              children: List.generate(4, (index) => Container(
                height: size.height * 0.012,
                width: size.height * 0.012,
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height * 0.004),
                    border: Border.all(
                        color: Colors.black,
                        width: 1.5
                    )
                ),
              ),)
          ),
        ),
        Column(
          children: [
            const BigText(text: "Energy Saving",color: Colors.black,fontSize: 22,),
            const SizedBox(height: 10,),
            const SmallText(text: "6 August 2021",),
          ],
        ),
        Container(
          width: size.height * 0.05,
          height: size.height * 0.05,

          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
          ),
          child: Icon(
            Icons.filter_alt_rounded,color: Colors.black,
          ),
        )
      ],
    );
  }
}

