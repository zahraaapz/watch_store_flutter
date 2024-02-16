import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_flutter/data/repo/home_repo.dart';
import 'package:watch_store_flutter/screens/home/bloc/home_event.dart';
import 'package:watch_store_flutter/screens/home/bloc/home_state.dart';

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