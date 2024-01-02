import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/data.dart/data.dart';
import 'package:food_delivery/model/item_model.dart';
import 'package:food_delivery/provider/data_provider.dart';
import 'package:food_delivery/router/router.dart';
import 'package:food_delivery/screens/bottom_sheet/order.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LikedProductPage extends StatefulWidget {
  const LikedProductPage({super.key});

  @override
  State<LikedProductPage> createState() => _LikedProductPageState();
}

class _LikedProductPageState extends State<LikedProductPage> {
  num totalprice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprice();
  }

  getprice() {
    final dataprovider = Provider.of<DataProvider>(context, listen: false);
    var p = dataprovider.likedproduct;
    for (int i = 0; i <= p.length - 1; i++) {
      print(p[i].price);
      totalprice = totalprice + p[i].price;
      print(totalprice);
    }
  }

  @override
  Widget build(BuildContext context) {
    Data itemlist = Data();
    final dataprovider = Provider.of<DataProvider>(context);

    clearlist() {
      dataprovider.likedproduct.clear();
      setState(() {
        totalprice = 0;
      });
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shopping",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Urbanist-Italic'),
                      ),
                      Text(
                        "Cart",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Urbanist-Italic'),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          clearlist();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "All item's are removed from the Cart 🙁",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Urbanist-Italic'),
                                  )));
                        });
                      },
                      icon: const Icon(
                        CupertinoIcons.delete,
                        size: 35,
                      ))
                ],
              ),
            ),
          ),
          dataprovider.likedproduct.length != 0
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5 + 80,
                  child: ListView.builder(
                    itemCount: dataprovider.likedproduct.length,
                    itemBuilder: (context, index) {
                      var data = dataprovider.likedproduct[index];
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .pushNamed(Routers.productpage.name, extra: data);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Dismissible(
                            background: Container(
                              color: Colors.grey.shade800,
                              child: const Icon(
                                CupertinoIcons.delete,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            onDismissed: (direction) {
                              setState(() {
                                dataprovider.removeitem(index);
                                totalprice = totalprice - data.price;
                              });
                            },
                            key: Key(
                                dataprovider.likedproduct[index].toString()),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                child: ListTile(
                                  style: ListTileStyle.list,
                                  leading: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(
                                      data.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  title: Text(
                                    data.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Urbanist-Italic'),
                                  ),
                                  subtitle: Text(
                                    data.desc,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.placeholderImage + " Quantity",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Urbanist-Italic'),
                                      ),
                                      Text(
                                        "\$" + data.price.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Urbanist-Italic'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        var data = ItemModel(
                            id: 5,
                            image: "assets/pizza_image.png",
                            name: "Margarita Pizza ",
                            desc:
                                "Voluptate incididunt dolor consequat aliquip sit. Duis quis ea velit esse enim ipsum duis cupidatat. Eu sit culpa dolor ipsum ut nostrud irure culpa aliqua irure labore irure id magna.",
                            price: 14,
                            time: "45 Min",
                            calories: "410 Calories",
                            rating: "4.5",
                            placeholderImage: "assets/chilli.png");
                        GoRouter.of(context)
                            .pushNamed(Routers.productpage.name, extra: data);
                      },
                      child: Container(
                        height: 250,
                        width: 390,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                blurRadius: 2.0,
                              )
                            ],
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(
                          "assets/pizza_img.jpg",
                          fit: BoxFit.cover,
                          width: 380,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Trending Now ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Urbanist-Italic'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: SizedBox(
                        height: 243,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: itemlist.items.length,
                          itemBuilder: (context, index) {
                            var data = itemlist.items[index];
                            return GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    Routers.productpage.name,
                                    extra: data);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'Urbanist-Italic'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 10, right: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$${data.price}",
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily:
                                                      'Urbanist-Italic'),
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
          Row(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 30, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$totalprice",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Urbanist-Italic'),
                    ),
                    Text(
                      dataprovider.likedproduct.length.toString() + " Items",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Urbanist-Italic'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  order_placed(context, dataprovider.likedproduct.length,
                      totalprice.toInt());
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Container(
                    height: 70,
                    width: 280,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text(
                      "Place Order",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Urbanist-Italic'),
                    )),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
