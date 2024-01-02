import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home_page.dart';
import 'package:food_delivery/screens/likedproduct_page.dart';
import 'package:food_delivery/screens/map_page.dart';
import 'package:food_delivery/screens/search_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  List<String> icondata = [
    "assets/dinnerIcon.png",
    "assets/search.png",
    "assets/heart.png",
    "assets/markerIcon.png",
  ];
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const LikedProductPage(),
    MapPage(flag: false, pad: 100),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        child: Container(
          height: 100,
          decoration: const BoxDecoration(color: Colors.black),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: icondata.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: SizedBox(
                    width: index == 0
                        ? 40
                        : index == 3
                            ? 35
                            : 30,
                    height: 30,
                    child: Image.asset(
                      icondata[index],
                      color:
                          index == selectedIndex ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
