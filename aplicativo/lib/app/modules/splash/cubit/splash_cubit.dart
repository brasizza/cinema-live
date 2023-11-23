import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void changeStep({required String step}) {
    emit(SplashLoading(step: step));
  }

  Future<void> loading() async {
    changeStep(step: 'Iniciando');
    await Future.delayed(const Duration(seconds: 1));
    changeStep(step: 'Carregando os dados do cinema');

    await Future.delayed(const Duration(milliseconds: 500));

    changeStep(step: 'Dados carregados');

    emit(SplashLoaded());
  }
}
