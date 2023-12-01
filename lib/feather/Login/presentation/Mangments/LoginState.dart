// ignore_for_file: file_names

abstract class LoginState {}

class InitalState extends LoginState {}

class LoadingLoginState extends LoginState {}

class ScafullLoginState extends LoginState {}

class ErorrLoginState extends LoginState {
  final Error;
  ErorrLoginState(this.Error);
}

class ChangeIconSuffix extends LoginState {}
