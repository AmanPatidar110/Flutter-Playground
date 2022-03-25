import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/assets.dart';

class CustomAppBar extends StatelessWidget {
  // const CustomAppBar({Key? key}) : super(key: key);

  final double scrollOffset;

  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _AppBarButton(title: 'TV Shows', onTap: () => {}),
                  _AppBarButton(title: 'Movies', onTap: () => {}),
                  _AppBarButton(title: 'My List', onTap: () => {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  // const _AppBarButton({Key? key}) : super(key: key);
  final String title;
  final void Function() onTap;

  const _AppBarButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
