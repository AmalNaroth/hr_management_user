part of 'dash_board_bloc.dart';

class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object?> get props => [];
}

class DashBoardSuccessState extends DashBoardState {
  final UserEntity data;
  const DashBoardSuccessState({required this.data});

  @override
  List<Object?> get props => [data];
}

class DashBoardInitialState extends DashBoardState {
  final UserEntity data;
  DashBoardInitialState({required this.data}) : super();

  // Assuming your UserEntity class has a constructor like this:
  // UserEntity({required this.firstName, required this.lastName, ...})
  factory DashBoardInitialState.empty() {
    return DashBoardInitialState(
      data: UserEntity(
        firstName: "",
        lastName: "",
        userName: "",
        userEmail: "",
        userPassword: "",
        employeeId: "",
        joinDate: "",
        department: "",
        designation: "",
        imageFile: "",
        id: "",
      ),
    );
  }

  @override
  List<Object?> get props => [data];
}

class DashBoardLoadingState extends DashBoardState {}

class DashBoardErrorState extends DashBoardState {}
