import 'package:flutter/material.dart';
import 'package:home_smart_2/widget/big_text.dart';

import '../../widget/small_text.dart';
import 'components/custom_slider.dart';
import 'components/drop_down_button.dart';
import 'components/energy_devices_custom.dart';
import 'components/line_chart_custom.dart';


class EnergyScreen extends StatelessWidget {
  const EnergyScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<double> valueColumn = [
      10.2,
      12.5,
      50,
      80,
      60.82,
      60.22,
      70.62,
      20.42,
      0.22,
      40.52,
      10.82,
      95.12,
    ];
    List<String> valueRow = [
      "01",
      "02",
      "03",
      "04",
      "05",
      "06",
      "07",
      "08",
      "09",
      "10",
      "11",
      "12",
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(size),
            buildBody(valueColumn, valueRow),

          ],
        ),
      ),
    );
  }

   buildBody(List<double> valueColumn, List<String> valueRow) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
                children: [
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
                  LineChartColumnCustom(heightContainer: 250,listValueColumn: valueColumn,listValueRow: valueRow),
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
                  const EnergyDevicesCustom(valueDefault: 42,iconData: Icons.lightbulb_outline_rounded,name: "Air Conditioning",price: 20),
                  const EnergyDevicesCustom(valueDefault: 70,iconData: Icons.air_rounded,name: "Air Conditioning",price: 50),
                ],
              ),
      ),
    );
  }

  buildAppBar(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.02),
      child: Row(
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
            children: const [
              BigText(text: "Energy Saving",color: Colors.black,fontSize: 22,),
              SizedBox(height: 10,),
              SmallText(text: "6 August 2021",),
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
      ),
    );
  }
}


