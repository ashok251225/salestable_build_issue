import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent(
      {super.key, required this.hasData, required this.imageUrl});
  final bool hasData;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return hasData
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => const LoadingIndicator(
                indicatorType: Indicator.ballScale,

                /// Required, The loading type of the widget
                colors: [Colors.white],

                /// Optional, The color collections
                strokeWidth: 2,

                /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Color(0xFF0494FD),

                /// Optional, Background of the widget
                pathBackgroundColor: Color(0xFF0494FD)

                /// Optional, the stroke backgroundColor
                ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : SvgPicture.asset(
            "assets/images/user_circle.svg",
            fit: BoxFit.cover,
            height: 40,
            width: 40,
          );
  }
}
