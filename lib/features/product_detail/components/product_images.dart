import 'package:flutter/material.dart';
import 'package:shopx/config/theme/app_colors.dart';
import 'package:shopx/model/home_model/home_model.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Hero(
            tag: widget.product.id!,
            child: Image.network(widget.product.images![selectedImage],
                fit: BoxFit.fill),
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                widget.product.images!.length,
                (index) => buildSmallProductPreview(index),
              ),
            ],
          ),
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppColors.primary
                  .withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(widget.product.images![index]),
      ),
    );
  }
}
