import 'package:bloc/bloc.dart';
import 'package:hr_management_user/core/resources/data_state.dart';
import 'package:hr_management_user/features/user_side/domain/login/login_services.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginServices loginInstance) : super(LoginInitial()) {
    on<LoginButtonClickEvent>(
      (event, emit) async {
        emit(
          LoginLoadignState(),
        );
        final reponse = await loginInstance.loginFunction(
            email: event.email, password: event.password);

        if (reponse is DataSuccess) {
          emit(
            LoginSuccessState(successMessage: reponse.data),
          );
        } else {
          emit(
            LoginErrorState(errorMessage: reponse.error.toString()),
          );
        }
      },
    );
  }
}
