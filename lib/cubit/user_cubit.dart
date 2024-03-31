import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/repositories/user_repo.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitialState());
  final UserRepository userRepository;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  SignInModel? user;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePicState());
  }

////////////////
  signUp() async {
    emit(SignUpLoadingState());
    final response = await userRepository.signUp(
      name: signUpName.text,
      email: signUpEmail.text,
      password: signUpPassword.text,
      confirmPassword: confirmPassword.text,
      phone: signUpPhoneNumber.text,
      profilePic: profilePic!,
    );
    response.fold(
      (errMessage) => emit(SignUpFailureState(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccessState(message: signUpModel.message)),
    );
  }

  signIn() async {
    emit(SignInLoadingState());
    final response = await userRepository.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    response.fold(
        (errMessage) => emit(SignInFailureState(errMessage: errMessage[0])),
        (signInModel) => emit(SignInSuccessState()));
  }

  getUserProfile() async {
    final response = await userRepository.getUserProfile();

    response.fold(
        (errMessage) => emit(GetUserFailureState(errMessage: errMessage)),
        (user) => emit(GetUserSuccessState(user: user)));
  }
}
