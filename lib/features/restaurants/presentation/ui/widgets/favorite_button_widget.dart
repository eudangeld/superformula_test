import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteButton extends StatelessWidget {
  FavoriteButton({super.key, required this.value});

  final bool value;

  final outline = SvgPicture.asset('assets/vectors/heart_outline.svg');
  final filled = SvgPicture.asset('assets/vectors/heart_filled.svg');

  @override
  Widget build(BuildContext context) {
    return value ? filled : outline;
  }
}
