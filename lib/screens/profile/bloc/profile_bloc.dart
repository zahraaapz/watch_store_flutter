import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_flutter/data/model/order.dart';
import 'package:watch_store_flutter/data/repo/user_info_repo.dart';
import '../../../data/model/user_info.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IUserInfoRepo iUserInfoRepo;
  ProfileBloc(this.iUserInfoRepo) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      try {
        if (event is ProfileInitEvent) {
          emit(ProfileLoadingState());
          final userInfo = await iUserInfoRepo.getUserInfo();
          emit(ProfileLoadedState(userInfo));
        }
        else if(event is ReceivedOrderEvent){
          await iUserInfoRepo.getReceivedOrder().then((value) => emit(ReceivedOrderState(value)));
        }
        else if(event is CanceledOrderEvent){
          
                     await iUserInfoRepo.getCanceledOrder().then((value) => emit(CanceledOrderState(value)));

         
       
          
        }
        else if(event is ProcessingOrderEvent){
          try {
            await iUserInfoRepo.getProcessingOrder().then((value) => emit(ProcessingOrderState (value)));
          print('lzl');
          } catch (e) {
            emit(ProfileErrorState(e.toString()));

          }
        }


      } catch (e) {
        emit(ProfileErrorState(e.toString()));
      }
    });
  }
}
