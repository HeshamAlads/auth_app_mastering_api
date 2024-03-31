import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';


class UserState {}

final class UserInitialState extends UserState {}

final class SignInLoadingState extends UserState {}

final class SignInSuccessState extends UserState {}

final class SignInFailureState extends UserState {
  final String errMessage;

  SignInFailureState({required this.errMessage});
}

final class SignUpLoadingState extends UserState {}

final class SignUpSuccessState extends UserState {
  final String message;

  SignUpSuccessState({required this.message});
}

final class SignUpFailureState extends UserState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

final class UploadProfilePicState extends UserState {}


final class GetUserLoadingState extends UserState {}

final class GetUserSuccessState extends UserState {
  final UserModel user;

  GetUserSuccessState({required this.user});
}

final class GetUserFailureState extends UserState {
  final String errMessage;

  GetUserFailureState({required this.errMessage});
}
