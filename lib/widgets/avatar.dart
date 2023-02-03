import 'package:flutter/material.dart';
import 'package:flutter_responsive/mytheme.dart';

class Avatar extends StatelessWidget {
  final Orientation orientation;
  final Size size;
  final double imageSize;
  final double horizotal;
  final double cameraIconSize;

  const Avatar({
    Key? key,
    required this.orientation,
    required this.size,
    required this.imageSize,
    required this.horizotal,
    required this.cameraIconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: orientation == Orientation.landscape
              ? (size.width * 0.7) * 0.5 - (imageSize / 2) - horizotal
              : size.width * 0.5 - (imageSize / 2) - horizotal,
          child: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              border: Border.all(color: MyTheme.splash, width: 4),
              borderRadius: BorderRadius.circular(120 / 2),
            ),
          ),
        ),
        Positioned(
          top: 4,
          left: orientation == Orientation.landscape
              ? (size.width * 0.7) * 0.5 - (imageSize / 2) - horizotal + 4
              : size.width * 0.5 - (imageSize / 2) - horizotal + 4,
          child: Container(
            width: imageSize - (4 * 2),
            height: imageSize - (4 * 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              borderRadius: BorderRadius.circular((imageSize - (4 * 2)) / 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular((imageSize - (4 * 2)) / 2),
              child: const Image(
                image: AssetImage('assets/images/rratcha.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: imageSize - (4 * 2) - (cameraIconSize / 2) - 4,
          left: orientation == Orientation.landscape
              ? (size.width * 0.7) * 0.5
              : size.width * 0.5,
          child: Container(
            height: cameraIconSize,
            width: cameraIconSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cameraIconSize / 2),
              color: MyTheme.appBarColor,
            ),
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
