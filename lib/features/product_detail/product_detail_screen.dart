import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/home/cubit/home_cubit.dart';
import 'package:shopx/model/home_model/home_model.dart';

import 'components/product_images.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, this.product}) : super(key: key);
  final ProductModel? product;

  // find product with id

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        print(HomeCubit.get(context).homeModel!.data!.products[0].description);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProductImages(product: product!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
