import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bpbm_technician/common/methods/package_info.dart';

part 'open_app_event.dart';
part 'open_app_state.dart';

class OpenAppBloc extends Bloc<OpenAppEvent, OpenAppState> {
  OpenAppBloc() : super(OpenAppInitial()) {
    on<OpenAppEvent>((event, emit) async {
      if (event is OpenAppStarted) {
        final versionName = await packageInformation();
        emit(
          OpenAppSplashScreen(
            versionName: versionName,
          ),
        );
        await Future.delayed(Duration(seconds: 2));
        emit(AppUpdateStatusOptional());
      }

      if (event is OpenAppFinished) {
        emit(OpenAppSuccess());
      }
    });
  }
}
