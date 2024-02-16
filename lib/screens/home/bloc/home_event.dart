import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable{


  @override
  List<Object> get props=>[];

}

class HomeInit extends HomeEvent{}