import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: AppColors.grey.withOpacity(0.3),
              spreadRadius: 1,
            )
          ]),
      child: const Icon(
        Icons.favorite_border,
        color: AppColors.grey,
        size: 18,
      ),
    );
  }
}
