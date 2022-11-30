import 'package:flutter/material.dart';
import 'package:flutter_ornek/components/bottomNavigation.dart';
import 'package:flutter_ornek/header.dart';
import 'package:flutter_ornek/label.dart';
import 'dart:ui';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color? selectedColor = Color(0xFF14d1bd);
  int? selectedCapacity = 64;

  List<Color> colors = [
    Color(0xFF808080),
    Color(0xFF14d1bd),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  List<int> capacities = [64, 128, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //HEADER
            header(widget.productTitle, context),
            SizedBox(height: 32),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NEW ETİKETİ
                   // label("New"),
                    SizedBox(
                      height: 0,
                    ),
                    //ÜRÜN FOTOĞRAFI
                    Center(child: Image.asset("assets/images/iphone.png")),
                    SizedBox(height: 30),

                    //RENK SEÇENEKLERİ
                    Text(
                      "Color",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1034)),
                    ),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: colors
                            .map((Color color) => colorOption(
                                color: color,
                                selected: selectedColor == color,
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                }))
                            .toList()),

                    //HAFIZA SEÇENEKLERİ
                    SizedBox(height: 32),
                    Text(
                      "Capacity",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1034)),
                    ),
                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: capacities
                          .map((int number) => capacityOption(
                                capacity: number,
                                selected: selectedCapacity == number,
                                onTap: () {
                                  setState(() {
                                    selectedCapacity = number;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 32),
                    //SEPETE EKLE BUTTON
                    GestureDetector(
                      onTap: () {
                        print("Ürün sepete eklendi.");
                        print("Ürünün ismi; " + widget.productTitle);
                        print("Ürünün rengi:" + selectedColor.toString());
                        print("Ürünün kapasitesi: " + selectedCapacity.toString());
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFF1F53E4),
                        ),
                        child: Text(
                          "Add to cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: 65,),
                  ],
                ),
              ),
            )
          ])),
              bottomdNavigationBar("Search")
    ])));
  }
}

Widget colorOption(
    {required Color color, required bool selected, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:
              Border.all(color: Color(0xFFF0001FC), width: selected ? 3 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption(
    {required int capacity, required bool selected, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 25),
      child: Text(
        "$capacity GB",
        style: TextStyle(
          color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE),
          fontSize: 16,
        ),
      ),
    ),
  );
}
