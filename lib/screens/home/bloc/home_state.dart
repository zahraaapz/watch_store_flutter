import 'package:equatable/equatable.dart';

import '../../../data/model/home.dart';


sealed class HomeState extends Equatable{


const HomeState();

@override
List<Object> get props=>[];


}

final class HomeLoading extends HomeState{}
final class HomeLoaded extends HomeState{
  final Home home;

  const HomeLoaded(this.home);
}
final class HomeError extends HomeState{}