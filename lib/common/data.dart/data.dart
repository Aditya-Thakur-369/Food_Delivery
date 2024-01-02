import 'package:food_delivery/model/item_model.dart';

class Data{
    List<ItemModel> items = [
    ItemModel(
        id: 1,
        image: "assets/pizza_image.png",
        name: "Margarita Pizza ",
        desc:
            "Voluptate incididunt dolor consequat aliquip sit. Duis quis ea velit esse enim ipsum duis cupidatat. Eu sit culpa dolor ipsum ut nostrud irure culpa aliqua irure labore irure id magna.",
        price: 14,
        time: "45 Min",
        calories: "410 Calories",
        rating: "4.5",
        placeholderImage: "assets/chilli.png"),
    ItemModel(
        id: 2,
        image: "assets/PngItem_2269637 1.png",
        desc:
            "Chicken curry with rice is a flavorful dish made by simmering chunks of chicken in a spicy curry sauce and serving it over a bed of steamed rice. The curry sauce is typically made with a blend of aromatic spices and coriander, as well as coconut milk for creaminess.  ",
        price: 11,
        placeholderImage: "assets/chilli.png",
        name: 'Garlic Bread ',
        time: '30 Min',
        rating: '4.9',
        calories: '275 Calories'),
    ItemModel(
        id: 3,
        image: "assets/PngItem_4744308 1.png",
        desc:
            "Exercitation occaecat consequat quis consequat culpa velit fugiat nostrud enim. Consequat eu laborum enim tempor deserunt fugiat velit amet consequat aute eiusmod minim. Est aute tempor esse laborum sit mollit voluptate non elit aliqua. Dolor est amet est officia do ut.",
        price: 12,
        placeholderImage: "assets/chilli.png",
        name: 'Mediterr Chicken  ',
        time: '40 Min',
        calories: '320 Calories',
        rating: '4.1'),
    ItemModel(
        id: 4,
        image: "assets/dish.png",
        desc:
            "Exercitation occaecat consequat quis consequat culpa velit fugiat nostrud enim. Consequat eu laborum enim tempor deserunt fugiat velit amet consequat aute eiusmod minim. Est aute tempor esse laborum sit mollit voluptate non elit aliqua. Dolor est amet est officia do ut.",
        price: 9,
        placeholderImage: "assets/chilli.png",
        name: 'Chicken Kabhab  ',
        time: '38 Min',
        calories: '250 Calories',
        rating: '3.5'),
  ];
}