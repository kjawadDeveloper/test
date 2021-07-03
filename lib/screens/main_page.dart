import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natalia_task/data/carousl_data.dart';
import 'package:natalia_task/data/constants.dart';
import 'package:natalia_task/data/jobs_list.dart';

import 'home_page/home_page.dart';

class ExplorerHome extends StatefulWidget {
  const ExplorerHome({Key? key}) : super(key: key);

  @override
  _ExplorerHomeState createState() => _ExplorerHomeState();
}

class _ExplorerHomeState extends State<ExplorerHome> {
  ValueNotifier<int> bottomIndexNotifier = ValueNotifier(0);

  List<Widget> bottomScreens = [
    MainPage(),
    Container(child: Center(child: Text("Coming Soon "),),),
    Container(child: Center(child: Text("Coming Soon "),),),
    Container(child: Center(child: Text("Coming Soon "),),),
    Container(child: Center(child: Text("Coming Soon "),),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder<int>(
        valueListenable: bottomIndexNotifier,
        builder: (context, index, value) {
          return bottomScreens[index];
        },
      ),
      bottomNavigationBar: ExplorerBottomNavigationBar(
        bottomIndexNotifier: bottomIndexNotifier,
      ),
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
        const Icon(
          Icons.message,
          color: Colors.black,
        ),
        const Icon(Icons.more_vert_outlined, color: Colors.black)
      ],
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.transparent));
    return SizedBox(
      height: 80.h,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(border: border, focusedBorder: border, filled: true, fillColor: Colors.grey.shade200, prefixIcon: Icon(Icons.search_rounded), hintText: searchFieldHint),
          )),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => searchController.clear(),
          )
        ],
      ),
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
          createOption(title: findCandidatesTab, selectedIconData: Icons.breakfast_dining, index: 0, unselectedIconData: Icons.breakfast_dining),
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

class ExplorerBottomNavigationBar extends StatefulWidget {
  final ValueNotifier<int> bottomIndexNotifier;
  const ExplorerBottomNavigationBar({Key? key, required this.bottomIndexNotifier}) : super(key: key);

  @override
  _ExplorerBottomNavigationBarState createState() => _ExplorerBottomNavigationBarState();
}

class _ExplorerBottomNavigationBarState extends State<ExplorerBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: widget.bottomIndexNotifier,
        builder: (context, value, child) {
          return BottomNavigationBar(
              onTap: (int value) {
                widget.bottomIndexNotifier.value = value;
              },
              currentIndex: value,
              items: [
                BottomNavigationBarItem(
                  activeIcon: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  icon: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: homeMenu,
                ),
                BottomNavigationBarItem(
                  activeIcon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  label: exploredMenu,
                ),
                BottomNavigationBarItem(
                    activeIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: netMenu),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    activeIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: activityMenu),
                BottomNavigationBarItem(
                    activeIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: postMenu)
              ]);
        });
  }
}
