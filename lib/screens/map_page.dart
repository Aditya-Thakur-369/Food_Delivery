// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_delivery/router/router.dart';

class MapPage extends StatefulWidget {
  bool flag;
  int pad;
  MapPage({
    Key? key,
    required this.flag,
    required this.pad,
  }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool track = false;
  bool flag = false;
  int pad = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() {
    flag = widget.flag;
    pad = widget.pad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height - pad,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/map.png",
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed(Routers.navigation.name);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade400)),
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade400)),
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/image 24.png",
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 450,
                  right: 190,
                  child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ], shape: BoxShape.circle, color: Colors.grey.shade300),
                      child: Image.asset('assets/image 18.png'))),
              Positioned(
                  top: 130,
                  right: 240,
                  child: Stack(children: [
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20.0, // Soften the shaodw
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ], shape: BoxShape.circle, color: Colors.white)),
                    ),
                    Positioned(
                      top: 16,
                      right: 20,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    ),
                    Image.asset('assets/Ellipse 2.png')
                  ])),
              Positioned(
                  top: 150,
                  right: 200,
                  child: Image.asset('assets/Vector 1.png')),

              // Bottom part
              Positioned(
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 2, left: 10, right: 10),
                  child: Container(
                    height: 230,
                    width: 410,
                    decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0, // Soften the shaodw
                            spreadRadius: 1.0,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.black26)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black38)),
                                child: Image.asset("assets/image 22.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "10-15 min",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Urbanist-Italic'),
                                    ),
                                    Text(
                                      'Delivery time',
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Urbanist-Italic'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black38)),
                                child: Image.asset("assets/image 21.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "70 Washington Square",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Urbanist-Italic'),
                                    ),
                                    Text(
                                      'Delivery address',
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Urbanist-Italic'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 78,
                          width: 420,
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black45)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, bottom: 5, right: 10),
                            child: Row(
                              children: [
                                track
                                    ? SizedBox.shrink()
                                    : Row(
                                        children: [
                                          Image.asset(
                                            "assets/image 20.png",
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Jordan Keith",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily:
                                                          'Urbanist-Italic'),
                                                ),
                                                Text(
                                                  "Courier",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily:
                                                          'Urbanist-Italic'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                track
                                    ? SizedBox.shrink()
                                    : SizedBox(
                                        width: 130,
                                      ),
                                AnimatedAlign(
                                  alignment: Alignment.centerRight,
                                  duration: Duration(seconds: 3),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        track = true;
                                      });
                                      Timer(const Duration(seconds: 1), () {
                                        setState(() {
                                          track = false;
                                        });
                                      });
                                    },
                                    child: Container(
                                        height: 70,
                                        width: 70,
                                        // margin: EdgeInsets.only(left: 130),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade700),
                                        child: Image.asset(
                                            "assets/Mask group.png")),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
