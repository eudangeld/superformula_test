import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurants/presentation/ui/strings/en_strings.dart';

import '../../../../../typography.dart';

class OpenClosedIndicatorWidget extends StatelessWidget {
  const OpenClosedIndicatorWidget({super.key, required this.value});

  final bool value;

  final openGreen = const Color(0xff5CD313);
  final closedRed = const Color(0xffEA5E5E);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value ? EnRestaurantsStrings.openNow : EnRestaurantsStrings.closed,
          style: AppTextStyles.openRegularItalic,
        ),
        const SizedBox(width: 10),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: value ? openGreen : closedRed),
        ),
      ],
    );
  }
}
