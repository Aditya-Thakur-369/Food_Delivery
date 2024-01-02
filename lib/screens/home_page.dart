import 'package:flutter/material.dart';
import 'package:food_delivery/common/data.dart/data.dart';
import 'package:food_delivery/model/catalog_model.dart';
import 'package:food_delivery/provider/data_provider.dart';
import 'package:food_delivery/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 0;
  List<Catagory> catagory = [
    Catagory(name: "Main", image: "assets/momo.png"),
    Catagory(name: "Soups", image: "assets/image 7.png"),
    Catagory(name: "Salads", image: "assets/cab.png"),
    Catagory(name: "Drinks", image: "assets/drink.png"),
  ];
  @override
  Widget build(BuildContext context) {
    Data itemlist = Data();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/image 5.png",
                      color: Colors.grey.shade700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final dp =
                          Provider.of<DataProvider>(context, listen: false);

                      print(dp.likedproduct);
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 224, 139, 167)),
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/image 12.png")),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Food",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Urbanist-Italic'),
                    ),
                    Text(
                      "Fast Delivery",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Urbanist-Italic'),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catagory.length,
                  itemBuilder: (context, index) {
                    var data = catagory[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 100,
                                  width: 90,
                                  child: Image.asset(
                                    data.image,
                                  )),
                              Text(
                                data.name,
                                style: TextStyle(
                                    color: index == selectedItem
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade500,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Urbanist-Italic'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Now ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Urbanist-Italic'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemlist.items.length,
                  itemBuilder: (context, index) {
                    var data = itemlist.items[index];
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(Routers.productpage.name, extra: data);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 170,
                                  child: Hero(
                                      tag: data.id,
                                      child: Image.asset(data.image))),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 5, left: 5),
                                child: Text(
                                  data.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Urbanist-Italic'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${data.price}",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Urbanist-Italic'),
                                    ),
                                    Image.asset(data.placeholderImage)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
