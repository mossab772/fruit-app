import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/colors.dart';
import 'package:fruit/model.dart';
import 'package:fruit/productItms.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List basketList = [];

  void toggle(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  bool isSelected(ProductModel product) => basketList.contains(product);

  List<String> items = [
    "assets/banners/slider1.png",
    "assets/banners/slider2.png",
    "assets/banners/slider3.png",
  ];
  List<CategoryModel> category = [
    CategoryModel(name: "fruits", image: "assets/category/fruits.png"),
    CategoryModel(name: "Millk and Egg", image: "assets/category/egg.png"),
    CategoryModel(name: "Baverges", image: "assets/category/baverges.png"),
    CategoryModel(name: "Luandry", image: "assets/category/luandry.png"),
    CategoryModel(name: "Vegatbels", image: "assets/category/vegatbels.png"),
  ];

  // ignore: non_constant_identifier_names
  List<ProductModel> Product = [
    ProductModel(
      "3.99",
      "4.8",
      "287",
      name: "bnana",
      image: "assets/fruits/banana.png",
    ),
    ProductModel(
      "2.99",
      "4.8",
      "287",
      name: "pepper",
      image: "assets/fruits/papper.png",
    ),
    ProductModel(
      "3.99",
      "4.8",
      "287",
      name: "Orange",
      image: "assets/fruits/orange.png",
    ),
     ProductModel(
      "6.99",
      "4.8",
      "287",
      name: "egg",
      image: "assets/category/egg.png",
    ),
     ProductModel(
      "9.99",
      "4.8",
      "287",
      name: "Baverges",
      image: "assets/category/baverges.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/motors.svg"),
            SizedBox(width: 10),
            Text("61 Hopper street..", style: TextStyle(fontSize: 19)),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_rounded, size: 30),
            Spacer(),
            SvgPicture.asset("assets/icons/bascit.svg"),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ///banner
                CarouselSlider.builder(
                  itemCount: items.length,
                  itemBuilder:
                      (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) => Image.asset(items[itemIndex]),
                  options: CarouselOptions(
                    height: 170,
                    aspectRatio: 1,
                    viewportFraction: 0.8,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    autoPlayInterval: Duration(seconds: 3),
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.linear,
                  ),
                ),

                ///category
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(category.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  category[index].image,
                                  width: 50,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              category[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),

                ///
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fruits",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: ApppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                ///products
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        ...List.generate(Product.length, (index) {
                          final item = Product[index];
                          return Productitms(
                            image: item.image,
                            name: item.name,
                            rate: item.rate,
                            rateCount: item.ratecount,
                            price: item.price,
                            onTap: () => toggle(item),
                            icon : isSelected(item) ? Icon(Icons.close): Icon(Icons.add) ,
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                ///card widget
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 77,
                    decoration: BoxDecoration(
                      color: ApppColors.primary,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 160,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: basketList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        basketList[index].image,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(width: 2, height: 40, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "View Basket",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Badge(
                            largeSize: 13,
                            backgroundColor: Colors.red,
                            label: Text(basketList.length.toString(),style: TextStyle(fontSize: 13),),
                            child: SvgPicture.asset(
                              "assets/icons/bascit.svg",
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),

                ///
              ],
            ),
          ),
        ],
      ),
    );
  }
}
