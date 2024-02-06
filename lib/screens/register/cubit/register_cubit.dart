import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watch_store_flutter/data/src/constant.dart';
import 'package:watch_store_flutter/utils/shared_pref_constant.dart';
import 'package:watch_store_flutter/utils/shared_preference.dart';
import '../../../data/model/model.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio dio=Dio();

  pickTheLocation({required context})async{

    await showSimplePickerLocation(
      isDismissible:true,
      title:"انتخاب موقعیت مکانی",
      textCancelPicker:"لغو",
      textConfirmPicker:'انتخاب',
      zoomOption:ZoomOption(initZoom:8),
      initPosition:GeoPoint(latitude:45.555,longitude:55.55),
      radius:8,
      context:context).then((val){
        emit(LocationPickedState(location: val));
      });
      
    
  }


register({required User user})async{
emit(LoadingState());

try {
  String? token=SharedPreferencesManager().getString(SharedPreferencesConstants.token);
  dio.options.headers['Authorization']='Bearer $token';
  await dio.patch(EndPoints.register,
  data:FormData.fromMap(user.toMap())).then((value) {
    if (value.statusCode==201) {
      emit(OkResponsestate());
    } else {
      emit(ErrorState());
    }
  });
} catch (e) {
   emit(ErrorState());
}

}
}
