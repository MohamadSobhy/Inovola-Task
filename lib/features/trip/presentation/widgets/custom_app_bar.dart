import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool isLiked;

  const CustomAppBar({@required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.star : Icons.star_border,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
