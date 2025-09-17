import 'package:bloc/bloc.dart';
import 'package:cartzy_app/feature/home/data/repo/repository/home_repository_contract.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(HomeInitial());

  final HomeRepositoryContract _repository;
}
