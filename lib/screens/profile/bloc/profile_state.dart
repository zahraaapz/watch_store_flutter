part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class CanceledOrderState extends ProfileState {
  final List<OrderDetail> orderList;
  const CanceledOrderState(this.orderList);
}

final class ReceivedOrderState extends ProfileState {
  final List<OrderDetail> orderList;

  const ReceivedOrderState(this.orderList);
}

final class ProcessingOrderState extends ProfileState {
  final List<OrderDetail> orderList;

  const ProcessingOrderState(this.orderList);
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  final UserInfo userInfo;

  const ProfileLoadedState(this.userInfo);
}

final class ProfileErrorState extends ProfileState {}
