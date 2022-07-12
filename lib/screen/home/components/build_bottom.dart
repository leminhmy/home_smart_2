import 'package:flutter/material.dart';

class BuildBottom extends StatefulWidget {
  const BuildBottom({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<int> onChanged;

  @override
  State<BuildBottom> createState() => _BuildBottomState();
}

class _BuildBottomState extends State<BuildBottom> {
  List<IconData> listIcon = [
    Icons.home_outlined,
    Icons.notifications_none_sharp,
    Icons.offline_bolt_outlined,
    Icons.person_outline,
  ];
  List<IconData> listIconSelected = [
    Icons.home_filled,
    Icons.notifications_rounded,
    Icons.offline_bolt,
    Icons.person_rounded,
  ];

  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.13,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipPath(
            clipper: BottomCustomPainter(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              height: size.height * 0.11,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) => GestureDetector(
                    onTap: (){
                      widget.onChanged(index);
                      setState((){
                        indexSelected = index;
                      });
                    },
                    child: ShaderMask(
                      shaderCallback: (Rect bounds){
                        return index == indexSelected?LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.lightBlueAccent,
                              Colors.blue,
                            ]
                        ).createShader(bounds):LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.grey,
                              Colors.grey,
                            ]
                        ).createShader(bounds);
                      },
                      child: index == indexSelected?Icon(listIconSelected[index],color: Colors.white,size: 35,):Icon(listIcon[index],color: Colors.grey,size: 35,),
                    ),
                  )
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child:  Container(
                height: size.height * 0.08,
                width: size.height * 0.08,
                alignment: Alignment.center,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.indigo,
                        ]
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        offset: Offset(0, 5),
                        blurRadius: 15,
                        spreadRadius: -2,
                      )
                    ]
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.height * 0.03,
                      width: size.height * 0.03,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          )
                      ),
                    ),
                    Icon(Icons.add,color: Colors.white,size: 25,),
                  ],
                )
            ),

          ),
        ],
      ),
    );

  }
}

class BottomCustomPainter extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.quadraticBezierTo(0, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60,20),radius:  Radius.circular(40),clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 0);




    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }






}
