import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/configs/theme.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/widgets/custom_text.dart';

class CategoryStrip extends StatelessWidget {
  // const CategoryStrip({ Key? key }) : super(key: key);

  final List<CategoryModel> categoryList = [
    CategoryModel('1', 'Bakery', 'images/bakery.png'),
    CategoryModel('2', 'Chinese', 'images/chinese.png'),
    CategoryModel('3', 'Drinks', 'images/drinks.png'),
    CategoryModel('4', 'Fast Food', 'images/fast food.png'),
    CategoryModel('5', 'Ice-Creams', 'images/ice-creams.png'),
    CategoryModel('6', 'Pizza', 'images/pizza.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            constraints: const BoxConstraints(minHeight: double.infinity),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.2),
                            offset: const Offset(2, 2),
                            blurRadius: 10,
                          ),
                        ]),
                    child: Image.asset(
                      categoryList[index].image,
                      height: 40,
                    )),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: categoryList[index].name,
                  color: Colors.black.withOpacity(0.6),
                  size: 14,
                ),
              ],
            ),
          );
        },
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
