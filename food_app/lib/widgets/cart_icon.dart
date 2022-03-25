import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';
import 'package:food_app/widgets/custom_text.dart';

class CartIcon extends StatelessWidget {
  final Color iconColour;

  const CartIcon({Key? key, required this.iconColour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.shopping_bag_outlined,
          color: iconColour,
          size: 30,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            width: 18,
            height: 18,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Padding(
                padding: EdgeInsets.all(2),
                child: CustomText(
                  text: "21",
                  color: white,
                  size: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
