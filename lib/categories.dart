import 'package:flutter/material.dart';
import 'package:flutter_ornek/category.dart';
import 'package:flutter_ornek/header.dart';

import 'components/bottomNavigation.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Camputers",
    "Accessories",
    "Smartphones",
    "Smart objects",
    "Speakers",
    "All",
    "Camputers",
    "Accessories",
    "Smartphones",
    "Smart objects",
    "Speakers",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HEADER
            header("Categories", context),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                  children: categories
                      .map((String title) => buildCategory(title, context))
                      .toList()),
            ),
          ],

        ),

      ),

      //BOTTOM NAVIGATION
      bottomdNavigationBar("search"),

    ])));
  }
}

Widget buildCategory(String title, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034)),
      ),
    ),
  );
}
