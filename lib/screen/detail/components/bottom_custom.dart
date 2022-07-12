import 'package:flutter/material.dart';

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