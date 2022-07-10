import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

class ChipDiscount extends StatelessWidget {
  const ChipDiscount({
    Key? key,
    required this.discountAmount,
    required this.bgColor,
  }) : super(key: key);
  final int? discountAmount;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return discountAmount != 0
        ? Container(
            width: 40,
            height: 24,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                '-$discountAmount%',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          )
        : const SizedBox();
  }
}
