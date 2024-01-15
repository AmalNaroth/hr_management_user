import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management_user/features/user_side/domain/user/user_services.dart';
import 'package:hr_management_user/features/user_side/infrastructure/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

@injectable
class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc(
    UserServises userInstance
  ) : super(DashBoardInitialState.empty()) {
    on<DashBoardInitialEvent>((event, emit) async{
      emit(DashBoardLoadingState(),);
      final data = await userInstance.getUserData();
      emit(DashBoardSuccessState(data: data.data!),);
    });
  }
}