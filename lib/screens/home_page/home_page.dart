import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natalia_task/data/carousl_data.dart';
import 'package:natalia_task/data/constants.dart';
import 'package:natalia_task/data/jobs_list.dart';

import '../main_page.dart';
import 'carousel_section.dart';
import 'jobs_horizontal_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 5.h,),
              buildAppBar(),
              const SearchField(), const TopThreeOptions(),
              CarouselSection()
              ,
              buildHomeScreenTagLine(),
              SizedBox(height: 5.h,),

              const JobsListHorizontal(),
              SizedBox(height: 5.h,),
              buildHomeScreenTagLine(),

            ],
          ),
        ),
      ),
    );
  }

  Container buildHomeScreenTagLine() {
    return Container(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(homeTagLine, style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp
              ),),
            );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        explorerAppBarText,
        style: TextStyle(color: Colors.black, fontSize: 30.sp),
      ),
      actions: [
        Badge(

          badgeContent: Text('2'),
          child: const Icon(
            Icons.message,
            color: Colors.black,
          ),
        ),
        const Icon(Icons.more_vert_outlined, color: Colors.black)
      ],
    );
  }
}


class TopThreeOptions extends StatefulWidget {
  const TopThreeOptions({Key? key}) : super(key: key);

  @override
  _TopThreeOptionsState createState() => _TopThreeOptionsState();
}

class _TopThreeOptionsState extends State<TopThreeOptions> {
  ValueNotifier<int> selectNotifier = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          createOption(title: findJobsTab, selectedIconData: Icons.breakfast_dining, index: 0, unselectedIconData: Icons.breakfast_dining),
          createOption(title: helpOthersTab, selectedIconData: Icons.breakfast_dining, index: 1, unselectedIconData: Icons.breakfast_dining),
          createOption(title: findCandidatesTab, selectedIconData: Icons.breakfast_dining, index: 2, unselectedIconData: Icons.breakfast_dining),
        ],
      ),
    );
  }

  Widget createOption({required String title, required IconData unselectedIconData, required IconData selectedIconData, required int index}) {
    return ValueListenableBuilder(
        valueListenable: selectNotifier,
        builder: (context, value, child) {
          return Column(
            children: [
              IconButton(
                icon: Icon(value == index ? selectedIconData : unselectedIconData),
                onPressed: () {
                  selectNotifier.value = index;
                },
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black, fontWeight: value == index ? FontWeight.bold : FontWeight.normal),
              )
            ],
          );
        });
  }
}


