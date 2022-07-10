import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/widgets/product_card_item.dart';

import '../cubit/home_cubit.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return homeCubit.homeModel != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    topSlider(homeCubit),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.9,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: List.generate(
                            homeCubit.homeModel!.data!.products.length,
                            (index) => ProductCardItem(
                                  product: homeCubit
                                      .homeModel!.data!.products[index],
                                )),
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget topSlider(HomeCubit homeCubit) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 200,
          reverse: false,
          initialPage: 0,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOutCirc,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
        ),
        itemCount: homeCubit.homeModel!.data!.banners.length,
        itemBuilder: (context, index, realIndex) => Image.network(
          homeCubit.homeModel!.data!.banners[index].image!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
