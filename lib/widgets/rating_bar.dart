import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart' as rating;
import '../../config/theme/app_colors.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rating.RatingBar.builder(
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 14,
      unratedColor: AppColors.grey.withOpacity(0.3),
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) =>
          SvgPicture.asset('assets/icons/starFilld.svg'),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
