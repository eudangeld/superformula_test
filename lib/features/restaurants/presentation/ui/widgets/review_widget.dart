import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/review.dart';

import '../../../../../typography.dart';
import 'rating_stars.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget(this.review, {super.key});

  final Review review;

  String getInitials(String userName) => userName.isNotEmpty
      ? userName.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 30);
    final initials = getInitials(review.userName);
    final hasUserThumb = review.photoUrl.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacer,
        RatingStarsWidget(
          value: review.rating.toDouble(),
        ),
        const SizedBox(height: 5),
        Text(
          review.text,
          style: AppTextStyles.openRegularHeadline,
        ),
        spacer,
        Row(
          children: [
            hasUserThumb
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      review.photoUrl,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(initials),
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                review.userName,
                style: AppTextStyles.openRegularText,
              ),
            ),
          ],
        ),
        spacer,
        const Divider(
          height: .1,
          thickness: 0,
        )
      ],
    );
  }
}
