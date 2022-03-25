import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';
import 'package:food_app/screens/Home/CategoryStrip/category_strip.dart';
import 'package:food_app/screens/Home/FeaturedItems/featured_items.dart';
import 'package:food_app/screens/Home/SearchBox/search_box.dart';
import 'package:food_app/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SearchBox(),
        const SizedBox(
          height: 15,
        ),
        CategoryStrip(),
        const Padding(
          padding: EdgeInsets.all(8),
          child: CustomText(
            text: "Featured",
            size: 20,
            color: grey,
          ),
        ),
        const FeaturedItems(),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: CustomText(
            text: "Popular",
            size: 20,
            color: grey,
          ),
        ),
      ],
    );
  }
}
