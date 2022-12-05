import 'package:banking_app/shared/Cubit/States.dart';
import 'package:banking_app/shared/sharedComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(AppStates initialState) : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  void UpdateDB(
    @required int coin,
    @required int id,
  ) {
    database!.rawUpdate(
        'UPDATE user SET coin = ? WHERE id = ? ', [coin, id]).then((value) {
      print('Data has been Updated');
      emit(UBdateDB());
    });
  }
}
