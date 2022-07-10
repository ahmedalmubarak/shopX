import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/home/pages/categories_page.dart';
import 'package:shopx/features/home/pages/favorites_page.dart';
import 'package:shopx/features/home/pages/products_page.dart';
import 'package:shopx/features/home/pages/profile_page.dart';
import 'package:shopx/model/home_model/home_model.dart';
import 'package:shopx/services/local/cache_helper.dart';
import 'package:shopx/services/remote/dio_helper.dart';
import 'package:shopx/services/remote/end_points.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  HomeModel? homeModel;
  List<Widget> pages = [
    const ProductsPage(),
    const CategoriesPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavIndex());
  }

  void getHomeData() {
    emit(HomeLoadingState());
    DioClient.getData(
      url: EndPoints.home,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.data!.banners[0].image);
      print(homeModel!.status);
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }
}
