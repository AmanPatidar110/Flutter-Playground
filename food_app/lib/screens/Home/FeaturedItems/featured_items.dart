import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/widgets/custom_text.dart';

List<Product> productList = [
  Product(
      name: "Cereals",
      price: 99.99,
      rating: 4.2,
      vendor: "GooDies",
      isFavourite: true,
      image: 'images/1.jpg'),
  Product(
      name: "Paneer",
      price: 299.99,
      rating: 4.9,
      vendor: "GooDies",
      isFavourite: false,
      image: 'images/2.jpg'),
  Product(
      name: "Curry",
      price: 99.99,
      rating: 5.0,
      vendor: "GooDies",
      isFavourite: true,
      image: 'images/3.jpg'),
];

class FeaturedItems extends StatelessWidget {
  const FeaturedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/itemDetails',
                    arguments: productList[index]);
              },
              child: Container(
                  height: 240,
                  width: 200,
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(
                      color: red.shade50,
                      offset: const Offset(15, 5),
                      blurRadius: 30,
                    ),
                  ]),
                  child: Column(
                    children: [
                      Image.asset(
                        productList[index].image ?? "images/1.jpg",
                        height: 160,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                    text: productList[index].name ?? "Cereal"),
                                Icon(
                                  productList[index].isFavourite ?? false
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: red,
                                  size: 22,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: productList[index].rating != null
                                          ? productList[index].rating.toString()
                                          : "5.0",
                                      color: grey,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: red,
                                      size: 16,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: red,
                                      size: 16,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: red,
                                      size: 16,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: red,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: grey.shade400,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text:
                                      "₹ ${productList[index].price.toString()}",
                                  weight: FontWeight.bold,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
