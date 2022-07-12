import 'package:flutter/material.dart';
import 'package:home_smart_2/screen/energy/energy_screen.dart';
import 'package:home_smart_2/screen/home/components/build_bottom.dart';
import 'package:home_smart_2/screen/home/components/home_page.dart';
import 'package:home_smart_2/widget/big_text.dart';

import '../../widget/small_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndexPage = 0;

  List page = [
    HomePage(),
    Container(
      child: Center(child: BigText(text: "Page Rỗng",),),
    ),
    EnergyScreen(),
    Container(
      child: Center(child: BigText(text: "Page Rỗng",),),
    ),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            page[_selectedIndexPage],
            Align(
              alignment: Alignment.bottomCenter,
              child: BuildBottom(onChanged: (index)=>onTapNav(index)),
            )
          ],
        ),
      ),

    );
  }
}

