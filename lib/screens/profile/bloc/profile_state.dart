part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class CanceledOrderState extends ProfileState {
  final List<Order> order;
  const CanceledOrderState(this.order);
}

final class ReceivedOrderState extends ProfileState {
  final List<Order> order;

  const ReceivedOrderState(this.order);
}

final class ProcessingOrderState extends ProfileState {
  final List<Order> order;

  const ProcessingOrderState(this.order);
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  final UserInfo userInfo;

  const ProfileLoadedState(this.userInfo);
}

final class ProfileErrorState extends ProfileState {
  final String e;

  ProfileErrorState(this.e);
}
