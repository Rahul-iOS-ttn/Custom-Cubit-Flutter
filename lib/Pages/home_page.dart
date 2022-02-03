import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Theming/colors.dart';
import '../Widgets/app_text.dart';
import '../Widgets/app_title_text.dart';
import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {

          if(state is LoadedState) {

            var info = state.places;

            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Appbar styling
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 30, color: Colors.black54,),
                Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30,),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const AppTitleText(text: "Discover"),
          ),
          const SizedBox(height: 20,),
          // Tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                labelColor: Colors.black54,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicator: const CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: const [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.only(left: 20),
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(itemBuilder: (_, index){
                  
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<AppCubits>(context).getToDetailPage(info[index]);
                    },
                    child: Container(
                    width: 200,
                    height: 300,
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + info[index].img),
                        fit: BoxFit.cover,
                      ),
                    ),
                                  ),
                  );
                },
                itemCount: info.length,
                scrollDirection: Axis.horizontal,
              ),
              const Text("There"),
              const Text("Bye"),
              ],
            ),
          ),

          const SizedBox(height: 30,),
          // Explore more
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                AppTitleText(text: "Explore more", size: 22,),
                AppText(text: "See All", color: AppColors.textColor1,)
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 120,
            width: double.maxFinite,

            child: ListView.builder(itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(right: 50,),
                      width: 80,
                      height: 80,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("img/" + images.keys.elementAt(index)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    AppText(text: images.values.elementAt(index), color: AppColors.textColor2,)
                  ],
                ),
              );
            }, 
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            ),
          )
        ],
      );
          } else {
            return Container();
          }
        },
        ),
    );
  }
}


// Circle Tab Indicator

class CircleTabIndicator extends Decoration {

  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

//Box painter for Decoration

class _CirclePainter extends BoxPainter {

  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {

    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}