import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import 'custom_app_bar.dart';

class TripImagesBanner extends StatelessWidget {
  final List<String> images;
  final bool isLiked;

  const TripImagesBanner({
    @required this.images,
    @required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: screenSize.height * 0.4,
          width: double.infinity,
          child: PageIndicatorContainer(
            length: images.length,
            child: PageView(
              children: images
                  .map(
                    (imageUrl) => Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
            ),
            align: IndicatorAlign.bottom,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).padding.top,
          child: CustomAppBar(
            isLiked: isLiked,
          ),
        ),
      ],
    );
  }
}
