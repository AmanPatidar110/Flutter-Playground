import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';
import 'package:food_app/widgets/cart_icon.dart';
import 'package:food_app/widgets/custom_text.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            const CustomText(text: "Shopping Bag"),
            const CartIcon(
              iconColour: Colors.black,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Material(
          elevation: 20,
          shadowColor: red[100],
          child: ListTile(
            leading: CircleAvatar(
                radius: 35, backgroundImage: AssetImage('images/2.jpg')),
            title: const CustomText(
              text: "Paneer",
            ),
            subtitle: const CustomText(
              text: "RANDOM",
              size: 12,
              color: grey,
            ),
          ),
        )
      ],
    );
  }
}
