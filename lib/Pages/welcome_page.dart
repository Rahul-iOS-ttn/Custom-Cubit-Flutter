import 'package:flutter/material.dart';


import '../Theming/colors.dart';
import '../Widgets/app_text.dart';
import '../Widgets/app_title_text.dart';
import '../Widgets/responsive_button.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/"+images[index],),
              fit: BoxFit.cover,
          ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTitleText(text: "Trips"),
                  const AppText(text: "Mountain", size: 30.0,),
                  const SizedBox(height: 20,),
                  Container(
                    width: 250, 
                    child: const AppText(
                      text: "Mountain hikes give you an incredible sense of freedom along with endurance",
                      ),
                    ),
                  const SizedBox(height: 40,),
                  ResponsiveButton(width: 120,)
                ],
              ),
              Column(
                children: List.generate(3, (indexDots) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    width: 8,
                    height:(index == indexDots) ? 25 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (index == indexDots) ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                    ),
                  );
                }),
              )
            ],),
          ),
        );
      }),
    );
  }
}