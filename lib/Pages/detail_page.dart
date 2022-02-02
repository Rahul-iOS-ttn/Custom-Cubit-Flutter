import 'package:flutter/material.dart';

import '../Theming/colors.dart';
import '../Widgets/app_buttons.dart';
import '../Widgets/app_text.dart';
import '../Widgets/app_title_text.dart';
import '../Widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              //top: 0,
              child: Container(
                height: 350,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: 600,
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                // Details of the page
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTitleText(
                          text: "Yosemite",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const AppTitleText(
                          text: "\$ 250",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: 'USA, California',
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: (index < gottenStars)
                                  ? AppColors.starColor
                                  : AppColors.textColor1,
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const AppText(
                          text: '(4.0)',
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AppTitleText(
                      text: 'People',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    const AppText(
                      text: 'Number of people in your group',
                      color: AppColors.mainTextColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                                isIcon: false,
                                text: "${index + 1}",
                                color: (selectedIndex == index)
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                borderColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTitleText(
                      text: 'Description',
                      size: 20,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppText(
                      text:
                          'You must travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.',
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    size: 60,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(width: 10,),
                  ResponsiveButton(
                    isResponsive: true,

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
