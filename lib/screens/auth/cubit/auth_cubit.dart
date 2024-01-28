import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/src/constant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()){

    emit(LoggedINState());
  }

  sensSms(String mobile) async {
    emit(LoadingState());

    try {
      await Dio()
          .post(EndPoints.sendSms, data: {'mobile': mobile}).then((value) {
        if (value.statusCode == 201) {
          emit(SentState());
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }  
  
  verifycode(String mobile,String code) async {
    emit(LoadingState());

    try {
      await Dio()
          .post(EndPoints.checkSms, data: {'mobile': mobile,'code':code}).then((value) {
        if (value.statusCode == 201) {
          emit(VerifiedState());
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
