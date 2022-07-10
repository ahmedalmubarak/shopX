import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopx/features/home/cubit/home_cubit.dart';
import 'package:shopx/services/local/cache_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/homeRed.svg'),
                icon: SvgPicture.asset('assets/icons/home.svg'),
                label: 'home',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/cartRed.svg'),
                icon: SvgPicture.asset('assets/icons/cart.svg'),
                label: 'categories',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/heartRed.svg'),
                icon: SvgPicture.asset('assets/icons/heart.svg'),
                label: 'favorites',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/userRed.svg'),
                icon: SvgPicture.asset('assets/icons/user.svg'),
                label: 'profile',
              ),
            ],
            currentIndex: homeCubit.currentIndex,
            onTap: (index) => homeCubit.changeBottom(index),
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
          ),
          body: SafeArea(child: homeCubit.pages[homeCubit.currentIndex]),
        );
      },
    );
  }
}
