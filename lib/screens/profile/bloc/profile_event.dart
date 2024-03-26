part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileInitEvent extends ProfileEvent{}
final class ReceivedOrderEvent extends ProfileEvent{}
final class CanceledOrderEvent extends ProfileEvent{}
final class ProcessingOrderEvent extends ProfileEvent{}
