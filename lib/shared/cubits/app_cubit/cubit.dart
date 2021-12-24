import 'package:flutter_app_news/shared/cubits/app_cubit/states.dart';
import 'package:flutter_app_news/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool themeMode = true;

  void toggleThemeMode({bool? sharedThemeMode}) {
    if (sharedThemeMode != null) {
      themeMode = sharedThemeMode;
      emit(AppToggleModeState());
    } else {
      themeMode = !themeMode;
      CacheHelper.setBool(key: 'isDark', value: themeMode).then((value) {
        emit(AppToggleModeState());
      });
    }
  }
}
