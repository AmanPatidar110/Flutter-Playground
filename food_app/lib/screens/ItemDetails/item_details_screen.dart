import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/widgets/cart_icon.dart';
import 'package:food_app/widgets/custom_text.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetails =
        ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreaseSize: 1.2,
                    dotIncreasedColor: red,
                    autoplay: false,
                    images: const [
                      AssetImage('images/2.jpg'),
                      AssetImage('images/1.jpg'),
                      AssetImage('images/3.jpg'),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: white,
                          ),
                          color: Colors.black,
                        ),
                        const CartIcon(
                          iconColour: white,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 13,
                    bottom: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              offset: const Offset(2, 1),
                              blurRadius: 3,
                            )
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: productDetails.name.toString(),
                        size: 26,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "by ${productDetails.vendor.toString()}",
                        size: 14,
                        color: grey,
                      ),
                    ],
                  ),
                  CustomText(
                    text: "₹${productDetails.price.toString()}",
                    color: grey,
                    size: 18,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add To Bag"),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
