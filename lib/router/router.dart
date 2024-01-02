// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routers {
  static AppRouter navigation = AppRouter(name: '/', path: "/");
  static AppRouter homepage = AppRouter(name: "home", path: '/home');
  static AppRouter searchpage = AppRouter(name: "search", path: "/search");
  static AppRouter productpage = AppRouter(name: "product", path: "/product");
  static AppRouter mappage = AppRouter(name: "map", path: "/map");
  static AppRouter likedproductpage =
      AppRouter(name: "likedproduct", path: "/likedproduct");
}
