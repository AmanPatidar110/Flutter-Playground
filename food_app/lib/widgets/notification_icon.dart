import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.notifications_none,
            color: white,
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: red, borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    );
  }
}
