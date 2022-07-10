import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopx/model/home_model/home_model.dart';
import 'package:shopx/widgets/rating_bar.dart';

import '../../config/theme/app_colors.dart';
import '../../constants/scales.dart';
import 'chip_discount.dart';
import 'rounded_icon_button.dart';

class ProductCardItem extends StatelessWidget {
  final ProductModel? product;
  const ProductCardItem({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      // height: 200,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                height: 184,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(defaultBorderRadius),
                    topRight: Radius.circular(defaultBorderRadius),
                  ),
                  child: Image.network(
                    product!.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChipDiscount(
                  discountAmount: product!.discount,
                  bgColor: AppColors.primary,
                ),
              ),
              const Positioned(
                top: 165,
                left: 110,
                child: RoundedIconButton(),
              )
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const RatingBarWidget(),
                    const SizedBox(width: 5),
                    Text(
                      '(0)',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: AppColors.grey),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  product!.name!,
                  style: Theme.of(context).textTheme.subtitle2,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      '${product!.oldPrice!}\$',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: AppColors.grey,
                            decoration: product!.oldPrice! != product!.price!
                                ? TextDecoration.lineThrough
                                : null,
                            decorationColor: AppColors.black,
                          ),
                    ),
                    const SizedBox(height: 5),
                    product!.oldPrice! == product!.price!
                        ? const Text('')
                        : Text(
                            '${product!.price!}\$',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: AppColors.primary),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
