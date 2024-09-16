import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({super.key, required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      starBuilder: (index, color) {
        return SvgPicture.asset('assets/vectors/rating_star.svg');
      },
      starCount: 5,
      starSize: 15,
      maxValue: 5,
      starSpacing: 0,
      valueLabelVisibility: false,
      starOffColor: const Color(0xffe7e8ea),
      starColor: Colors.yellow,
    );
  }
}
