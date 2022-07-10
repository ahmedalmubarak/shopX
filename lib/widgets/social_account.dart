import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/theme/app_colors.dart';
import '../../constants/scales.dart';

class SocialAccountItem extends StatelessWidget {
  const SocialAccountItem({
    Key? key,
    required this.iconName,
    this.onTap,
  }) : super(key: key);
  final String iconName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 92,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius + 8.0),
          color: AppColors.white,
        ),
        child: Center(
          child: SvgPicture.asset(iconName),
        ),
      ),
    );
  }
}
