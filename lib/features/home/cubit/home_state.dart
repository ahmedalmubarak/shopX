part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeChangeBottomNavIndex extends HomeState {}
