part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class GetCategoryLoading extends HomeState {}

class GetCatergorySuccess extends HomeState {}

class GetCategoryfailure extends HomeState {}

class GetProductLoading extends HomeState {}

class GetProductSuccess extends HomeState {}

class GetProductfailure extends HomeState {}
