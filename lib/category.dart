import 'package:flutter/material.dart';
import 'package:flutter_ornek/header.dart';
import 'package:flutter_ornek/productDetail.dart';
import 'components/bottomNavigation.dart';


class CategoryPage extends StatelessWidget {
  String categoryTitle;

  CategoryPage(this.categoryTitle);


  List<Map> products = [
    {
      "isim": "Surface Laptop 3",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "İphone 11 pro",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "Asus Rog Strix",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "Lenovo",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "Monster",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "Hp Evilon",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "Samsung Tab 6",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "LG POX",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "Toshiba",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
    {
      "isim": "Evigation",
      "fotograf": "assets/images/laptop.png",
      "fiyat": "999"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //HEADER
          header(categoryTitle, context),
          SizedBox(height: 32),
          //İÇERİK
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              children: products.map((Map product) {
                return buildContent(
                    product["isim"], product["fotograf"], product["fiyat"], context);
              }).toList(),
            ),
          ),

        ]),
      ),

              //BOTTOM NAVIGATION
              bottomdNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(photoUrl),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "USD $price",
                style: TextStyle(
                  color: Color(0xFF0001FC),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 18),
            ],
          )
        ],
      ),
    ),
  );
}
