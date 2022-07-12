import 'package:flutter/material.dart';
import 'package:home_smart_2/screen/detail/detail_screen.dart';

import '../../../widget/big_text.dart';
import '../../../widget/small_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.03),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          buildAppBar(size),
          SizedBox(
            height: 20,
          ),
          buildBody(size,context),

        ],
      ),
    );

  }
  buildBody(Size size,BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) => Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.height * 0.02)
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: size.height * 0.1,
                        child: Image.asset('assets/images/avatar.png',fit: BoxFit.cover,)),
                    SizedBox(height: 5,),
                    BigText(text: "Temperature",fontSize: size.height * 0.02,),
                    SizedBox(height: 5,),
                    BigText(text: "29°"),
                  ],
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(4, (index) =>GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const DetailScreen()));
                },
                child: Padding(
                  padding:  EdgeInsets.only(bottom: size.height * 0.025),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(size.height * 0.012)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.25,
                              child: Image.asset('assets/images/living_home.png',fit: BoxFit.cover,)),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: size.height * 0.03,vertical: size.height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: "Living Room"),
                                SizedBox(height: 5,),
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
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )),
            )


          ],
        ),
      ),
    );
  }

  buildAppBar(Size size) {
    return Row(
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
        Row(
          children: [
            Container(
              width: size.height * 0.02,
              height: size.height * 0.02,
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
            ),
            const SizedBox(width: 5,),
            const SmallText(text: "15 Devices Running",),
          ],
        ),
        Container(
          width: size.height * 0.05,
          height: size.height * 0.05,

          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1,2),
                    blurRadius: 5,
                    spreadRadius: 1
                )
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/avatar.png'),
              )),
        )
      ],
    );
  }
}
