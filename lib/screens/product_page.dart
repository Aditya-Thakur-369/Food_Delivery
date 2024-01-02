import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/provider/data_provider.dart';
import 'package:go_router/go_router.dart';

import 'package:food_delivery/model/item_model.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ItemModel model;
  const ProductPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int counter = 1;
  int price = 0;
  bool flag = false;
  late ItemModel data;
  late ItemModel adddata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    data = ItemModel(
        id: widget.model.id,
        image: widget.model.image,
        name: widget.model.name,
        desc: widget.model.desc,
        price: widget.model.price,
        time: widget.model.time,
        calories: widget.model.calories,
        rating: widget.model.rating,
        placeholderImage: widget.model.placeholderImage);
    price = data.price;
  }

  getadddata() {
    setState(() {
      adddata = ItemModel(
          id: data.id,
          image: data.image,
          name: data.name,
          desc: data.desc,
          price: price,
          time: data.time,
          calories: data.calories,
          rating: data.rating,
          placeholderImage: counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<DataProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: 450,
              decoration: const BoxDecoration(color: Colors.black87),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 20),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pop();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade600,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.grey.shade400)),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.back,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.grey.shade400)),
                              height: 50,
                              width: 50,
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "❤️",
                                    style: TextStyle(fontSize: 30),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: MediaQuery.of(context).size.height * 0.7,
              width: 430,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(top: 170),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 10),
                      child: FittedBox(
                        child: Text(
                          data.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Urbanist-Italic'),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset("assets/image 13.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data.time,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Urbanist-Italic'),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset("assets/image 14.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data.calories,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Urbanist-Italic'),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset("assets/image 15.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data.rating,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Urbanist-Italic'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          height: 200,
                          child: Text(
                            data.desc,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Urbanist-Italic'),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (counter > 0 && counter != 1) {
                                        counter -= 1;
                                        price = price - data.price;
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.minus,
                                    size: 30,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: Center(
                                  child: Text(
                                    counter.toString(),
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Urbanist-Italic'),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      counter += 1;
                                      price = data.price + price;
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.add,
                                    size: 30,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!flag) {
                              setState(() {
                                getadddata();
                                dataprovider.setlist(adddata);
                                flag = true;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          "Item Added Successfully 🙂",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Urbanist-Italic'),
                                        )));
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        "This item has already added 🙃 ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Urbanist-Italic'),
                                      )));
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Urbanist-Italic'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FittedBox(
                                  child: Text(
                                    "\$$price",
                                    style: const TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Urbanist-Italic'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            // top: 100,
            left: 80,
            bottom: 400,
            right: 80,
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Hero(
                tag: data.id,
                child: Image.asset(
                  data.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
