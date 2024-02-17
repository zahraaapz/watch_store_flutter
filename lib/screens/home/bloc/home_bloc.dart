import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_flutter/data/repo/home_repo.dart';
import 'package:watch_store_flutter/data/model/home.dart';



part 'home_event.dart';
part 'home_state.dart';
class HomeBloc extends Bloc<HomeEvent,HomeState>{

final IHomeRepo homeRepo;

  HomeBloc(this.homeRepo):super(HomeLoading()){
    on<HomeEvent>((event ,emit)async{
      if (event is HomeInit) {
        try {
          emit(HomeLoading());
          final home=await homeRepo.getHome();
          emit(HomeLoaded(home));
        } catch (e) {
          emit(HomeError());
        }
      }
    });
  }

}