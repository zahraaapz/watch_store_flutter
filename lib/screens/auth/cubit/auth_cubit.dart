import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/src/constant.dart';
import 'package:watch_store_flutter/utils/shared_pref_constant.dart';
import 'package:watch_store_flutter/utils/shared_preference.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    emit(LoggedINState());
  }

  sensSms(String mobile) async {
    emit(LoadingState());

    try {
      await Dio()
          .post(Endpoints.sendSms, data: {'mobile': mobile}).then((value) {
        if (value.statusCode == 201) {
            print(value.toString());
          emit(SentState(mobile: mobile));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }

  verifycode(String mobile, String code) async {
    emit(LoadingState());

    try {
      await Dio().post(Endpoints.checkSmsCode,
          data: {'mobile': mobile, 'code': code}).then((value) {
        if (value.statusCode == 201) {
            print(value.toString());
            SharedPreferencesManager().saveString(SharedPreferencesConstants.token, value.data['data']['token']);
          if (value.data['data']['is_registered']) {
            emit(VerifiedIsRegisterState());
          } else {
            emit(VerifiedNotRegisterState());
          }
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
