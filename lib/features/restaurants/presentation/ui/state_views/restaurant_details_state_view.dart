import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../typography.dart';
import '../../../domain/entities/restaurant_details.dart';
import '../strings/en_strings.dart';
import '../widgets/network_image_loader.dart';
import '../widgets/open_closed_indicator_widget.dart';
import '../widgets/review_widget.dart';

class RestaurantDetailsStateView extends StatelessWidget {
  const RestaurantDetailsStateView(
    this.restaurantDetails, {
    super.key,
  });

  final RestaurantDetails restaurantDetails;

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: .1);
    const spacer = SizedBox(height: 30);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.width,
            width: size.width,
            child: NetworkImageLoader(
              boxFit: BoxFit.cover,
              url: restaurantDetails.photos.first,
            ),
          ),
          spacer,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          restaurantDetails.price,
                          style: AppTextStyles.openRegularText,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          restaurantDetails.categories.first,
                          style: AppTextStyles.openRegularText,
                        ),
                      ],
                    ),
                    OpenClosedIndicatorWidget(
                      value: restaurantDetails.isCLosed,
                    ),
                  ],
                ),
                spacer,
                divider,
                spacer,
                Text(
                  EnRestaurantsStrings.address,
                  style: AppTextStyles.openRegularText,
                ),
                spacer,
                Text(
                  restaurantDetails.address,
                  style: AppTextStyles.openRegularTitleSemiBold,
                ),
                Text(
                  '${restaurantDetails.city}, ${restaurantDetails.state} ${restaurantDetails.postalCode}',
                  style: AppTextStyles.openRegularTitleSemiBold,
                ),
                spacer,
                divider,
                spacer,
                Text(
                  EnRestaurantsStrings.overallRating,
                  style: AppTextStyles.openRegularText,
                ),
                Row(
                  children: [
                    Text(
                      restaurantDetails.rating.toString(),
                      style: AppTextStyles.loraRegularHeadline
                          .copyWith(fontSize: 28),
                    ),
                    SvgPicture.asset('assets/vectors/rating_star.svg')
                  ],
                ),
                spacer,
                divider,
                spacer,
                Text(
                  '${restaurantDetails.reviews.length.toString()} ${EnRestaurantsStrings.reviews}',
                  style: AppTextStyles.openRegularText,
                ),
                ...restaurantDetails.reviews.map(ReviewWidget.new),
                spacer,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
